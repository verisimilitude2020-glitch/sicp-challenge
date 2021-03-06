#|
a. The sum procedure is only the simplest of a vast number of similar abstractions that can be captured as higher-order procedures.Wite an analogous procedure called product that returns the product of the values of a function at points over a given range. Show how to define factorial in terms of product. Also use product to compute approximations to below series 

 π       2 * 4 * 4 * 6 * 6 * 8 * 8 ...
---  = -------------------------------
 4       3 * 3 * 5 * 5 * 7 * 7 * 9 * 9

 For sub-problem a, write a recursive function.
|#

#|
====> 

 The generic, linear recursive procedure for finding product

 (define (product term a next b)
    (if (> a b) 1
    (* (term a) (product term (next a) next b))))

i. Find the product of a values of a function in a given range.
--------------------------------------------------------------------
|#
(define (product term a next b)
    (if (> a b) 1
    (* (term a) (product term (next a) next b))))

(define (term a) a)

(define (inc a) (+ a 1))

(product term 1 inc 10)

#|
==> 3628800
|#

#|
ii. Finding the factorial of a given number

This is same as i. There, we multiply the first 10 numbers. That is same as computing 10's factorial.
|#

#|
iii. Compute the approximations to the series for a certain range.

The series is also known as John Wallis' formula.
 
n = infinity
__                      (2n)              (2n)
||             =        --------- *   -----------------        
n = 1                   (2n - 1)         (2n + 1)

Linear recursive way
|#

(define (product term a next b)
    (if (> a b) 1
    (* (term a) (product term (next a) next b))))

(define ( wallis-product n)
  (define (term n)
    (* ( / (* 2 n) (- (* 2 n) 1))
       (/ (* 2 n ) (+ (* 2 n) 1))))
  (product term 1.0 inc n))


(define (inc n) (+ n 1))

(wallis-product 10)
#|
==> 1.5338519033217488
|#

#|
b. Rewrite the above procedure product in linear iterative way

Wallis product in a iterative function
|#

(define (product term a next b)
    (define (iter a result)
      (if (> a b)
      result
      (iter (next a) (* result (term a)))))
   (iter a 1))

(define ( wallis-product n)
  (define (term n)
    (* ( / (* 2 n) (- (* 2 n) 1))
       (/ (* 2 n ) (+ (* 2 n) 1))))
  (product term 1.0 inc n))


(define (inc n) (+ n 1))

(wallis-product 10)
;;; ==> 1.5338519033217488

