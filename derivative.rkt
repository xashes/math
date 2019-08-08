#lang racket

(require plot)
(require "linear.rkt")

(define (position t)
  (+ (* 15
        (sqr t))
     7))

(plot (list (axes)
            (function position 0 2)
            (function (points->line (vector 2 (position 2))
                                    (vector 1 (position 1)))
                      0 2
                      #:label "secant"
                      #:color 'orange
                      #:style 'dot)
            (function (slope->line (vector 1 (position 1))
                                   30)
                      0 2
                      #:label "tangent"
                      #:color 'green)
            )
      #:y-min 0)
