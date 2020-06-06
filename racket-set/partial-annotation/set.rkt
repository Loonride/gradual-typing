#lang typed/racket

(define-type Set (All (A) (U (Listof A))))

(: singleton (All (A) (-> A (Set A))))
(define (singleton x)
  (list x))

(: insert (All (A) (-> (Set A) A (Set A))))
(define (insert l x)
  (cond
    [(member l x) l]
    [else (list* x l)]))

(: member (All (A) (-> (Set A) A Boolean)))
(define (member l x)
    (cond
      [(empty? l) false]
      [else (or
             (equal? (first l) x)
             (member (rest l) x))]))

(provide Set singleton insert member)
