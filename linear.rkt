#lang racket

(provide points->line
         slope->line
         slope)

(define point/c (vectorof real?))

(define/contract (slope p1 p2)
  (-> point/c point/c real?)
  (let-values ([(x1 y1) (vector->values p1)]
               [(x2 y2) (vector->values p2)]
               )
    (/ (- y2 y1)
       (- x2 x1)))
  )
(module+ test
  (require rackunit rackunit/text-ui)

  (check-equal? (slope #(0 0) #(1 1)) 1)
  )

(define/contract (points->line p1 p2)
  (-> point/c point/c procedure?)
  (let-values ([(x1 y1) (vector->values p1)])
    (let ([s (slope p1 p2)])
      (lambda (x) (+ y1
                     (* s
                        (- x x1))))))
  )

(define/contract (slope->line p s)
  (-> point/c real? procedure?)
  (let-values ([(x0 y0) (vector->values p)])
    (lambda (x) (+ y0
                   (* s
                      (- x x0)))))
  )
(module+ test
  (check-equal? ((points->line #(0 0) #(1 1)) 2) 2)
  (check-equal? ((slope->line #(0 0) 1) 2) 2)
  )
