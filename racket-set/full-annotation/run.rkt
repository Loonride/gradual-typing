#lang typed/racket

(require "set.rkt")

(: fib (-> Integer Integer))
(define (fib n)
  (cond
    ((< n 0) (raise-user-error "must provide a Fibonacci index of 0 or greater"))
    ((= n 0) 0)
    ((= n 1) 1)
    (else (+ (fib (- n 1)) (fib (- n 2))))))

(: fibSet (-> Integer (Set Integer)))
(define (fibSet n)
  (cond
    ((< n 0) (raise-user-error "must provide a Fibonacci index of 0 or greater"))
    ((= n 0) (singleton (fib 0)))
    (else (insert (fibSet (- n 1)) (fib n)))))

(: exampleSet (Set (U Integer Symbol)))
(define exampleSet (insert (fibSet 10) 'a))
