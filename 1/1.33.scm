#| 

You can obtain an even more general version of accumulate (exercise 1.32) by introducing the notion of a filter on the terms to be combined. That is, combine only those terms derived from values in the range that satisfy a specified condition. The resulting filtered-accumulate abstraction takes the same arguments as accumulate, together with an additional predicate of one argument that specifies the filter. Write filtered-accumulate as a procedure. Show how to express the following using filtered-accumulate:

a. The sum of the squares of the prime numbers in the interval a to b (assuming that you have a prime? predicate already written)

Below procedures find the sum of squares from 1 to 10.

|#


#| Prime procedure |#
(define (prime? n)
  (define (square x) (* x x))

  (define (divides? a b)
    (= (remainder b a) 0))

  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
  
  (define (smallest-divisor n)
    (find-divisor n 2))

  (= n (smallest-divisor n)))


#| filter_accumulate procedure |#
(define (filter_accumulate combiner filter null-value term a next b)
    (define (iter a result)
      (if (> a b)
        result
      (iter (next a) (combiner result (if (filter a) (term a) null-value)))))
   (iter a null-value))


(define (term a) (* a a))

(define (inc a) (+ a 1))

(filter_accumulate * prime? 1 term 1 inc 10)

#| b. the product of all the positive integers less than n that are relatively prime to n (i.e., all positive integers i < n such that GCD(i,n) = 1). |#


(define (relatively-prime a b)
 (define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))
  (= (gcd a b) 1
  ))


(define (filter_accumulate combiner filter null-value term a next b)
    (define (iter a result)
      (if (> a b)
        result
      (iter (next a) (combiner result (if (filter a b) (term a) null-value)))))
   (iter a null-value))


(define (term a) (display a) a)

(define (inc a) (+ a 1))

(filter_accumulate * relatively-prime 1 term 1 inc 10)

