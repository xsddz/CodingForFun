#lang racket

(require 2htdp/image)


(define (sierpinski-triangle n)
    (cond
      [(zero? n) (triangle 1 "solid" "blue")]
      [else
       (local [(define c (sierpinski-triangle (- n 1)))]
         (above c
                (beside c c)))]))
