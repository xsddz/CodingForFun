#lang racket

(require 2htdp/image)


(define (sierpinski-carpet n)
    (cond
      [(zero? n) (square 1 "solid" (color 0 0 255 127))]
      [else
       (local [(define c (sierpinski-carpet (- n 1)))
               (define i (square (image-width c) "solid" "white"))]
         (above (beside c c c)
                (beside c i c)
                (beside c c c)))]))

(define (colored-carpet colors)
    (cond
      [(empty? (rest colors))
       (square 1 "solid" (first colors))]
      [else
       (local [(define c (colored-carpet (rest colors)))
               (define i (square (image-width c) "solid" (car colors)))]
         (above (beside c c c)
                (beside c i c)
                (beside c c c)))]))
