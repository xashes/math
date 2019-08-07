#lang racket

(require plot)
(require "linear.rkt")

(define (position t)
  (+ (* 15
        (sqr t))
     7))

(plot (list (axes)
            (function position 0 2)
            (function (points->line (vector 0.9 (position 0.9))
                                    (vector 1 (position 1)))
                      0 2))
      #:y-min 0)
