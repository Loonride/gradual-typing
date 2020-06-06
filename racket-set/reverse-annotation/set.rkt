#lang racket

(define (singleton x)
  (list x))

(define (member l x)
    (cond
      [(empty? l) false]
      [else (or
             (equal? (first l) x)
             (member (rest l) x))]))

(define (insert l x)
  (cond
    [(member l x) l]
    [else (list* x l)]))

(provide singleton insert member)
