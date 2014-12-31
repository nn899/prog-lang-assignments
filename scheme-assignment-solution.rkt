;; Homework 2 SCHEME

;; the following definition on inc was coded to test Answers
(define (inc x) ( + x 1))

#| Scheme: Answer 1
The following definition of findindex takes a list and an atom
as input and returns the indices for the occurance of the atom in
the list. If the atom is not in the list, then -1 is returned. |#

(define (findindex input_list item)
  (cond
    ((member item input_list)
      (findindex_helper input_list item))
    (else '(-1))))

(define (findindex_helper input_list item)
  (define (loop remaining_list index)
    (if (null? remaining_list) '()
      (let ((indices (loop (cdr remaining_list) (+ index 1))))
        (if (equal? (car remaining_list) item)
          (cons index indices) indices))))
  (loop input_list 0))

#| Scheme: Answer 2
The following implementation defines a function findrangeindex
which takes a list, a unary function f, and an atom x. It returns
a list such that each item i in the output list satisfies f(ℓi) = x. |#

(define (findrangeindex lst fcn element)
  (define (loop remaining-list index)
    (if (null? remaining-list) '()
      (let ((indices (loop (cdr remaining-list) (+ index 1))))
        (if (equal? (fcn (car remaining-list)) element)
          (cons index indices)
          indices))))
  (loop lst 0))

#| Scheme: Answer 4 |#
(define compose
  (lambda (func1 func2)
    (lambda (x) (func1 (func2 x)))))

#| Scheme Answer 5|#
(define (list_size list1)
  (length list1))

(define (equal_list_size list1 list2)
  (equal? (list_size list1) (list_size list2)))

(define (map2 list1 list2 pred fcn)
  (cond((equal? (equal_list_size list1 list2) #t)
          (map2_helper list1 list2 pred fcn))
        (else (quote ("Error: The lists are of different lengths")))))

(define (map2_helper list1 list2 pred fcn)
  (define (loop remaining_list1 remaining_list2 index)
    (if (null? remaining_list1) '()
      (let ((output (loop (cdr remaining_list1) (cdr remaining_list2) (+ index 1))))
        (if (equal? (pred (car remaining_list1)) #t)
          (cons (fcn (car remaining_list2)) output) (cons (car remaining_list2) output)))))
  (loop list1 list2 0))

(define (pred var) (> var 2))

(define (fcn var) (+ var 1))

#| Scheme: Answer-6 function 'skip' |#
(define (skip input)
    (lambda (arg)
      (if (= input 0) arg (skip (- input 1)))))
