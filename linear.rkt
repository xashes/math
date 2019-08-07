#lang racket

(provide points->line)

(define point/c (vectorof real?))

(define/contract (points->line p1 p2)
  (-> point/c point/c procedure?)
  (let-values ([(x1 y1) (vector->values p1)]
               [(x2 y2) (vector->values p2)]
               )
    (let ([t (/ (- y2 y1)
                (- x2 x1))])
      (lambda (x) (+ y1
                     (* t
                        (- x x1))))))
  )
