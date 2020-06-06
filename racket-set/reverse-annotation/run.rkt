#lang typed/racket

(define-type Set (Listof Integer))

(require/typed "set.rkt"
         [singleton (-> Integer Set)]
         [insert (-> Set Integer Set)])

(: fib (-> Integer Integer))
(define (fib n)
  (cond
    ((< n 0) (raise-user-error "must provide a Fibonacci index of 0 or greater"))
    ((= n 0) 0)
    ((= n 1) 1)
    (else (+ (fib (- n 1)) (fib (- n 2))))))

(: fibSet (-> Integer Set))
(define (fibSet n)
  (cond
    ((< n 0) (raise-user-error "must provide a Fibonacci index of 0 or greater"))
    ((= n 0) (singleton (fib 0)))
    (else (insert (fibSet (- n 1)) (fib n)))))

