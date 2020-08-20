#|
Show that the golden ratio ϕ (section 1.2.2 - EX 1.13) is a fixed point of the transformation x |-> 1 + 1/x, and use this fact to compute ϕ by means of the fixed-point procedure.

=====>
|#


#|
1. Now let's find the golden ratio ϕ. Per the exercise 1.13, 

ϕ = (1 + √5) / 2
Let's write a scheme procedure for this. For computing the square root of 5, let's use same Newton's method.

|#
(define (square x) (* x x))
(define (average x y) (/ (+ x y) 2.0))
(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (improve guess x)
  (average guess (/ x guess)))

(define golden-ratio (/ (+ 1 (sqrt 5) ) 2))

(display golden-ratio)
#| ===> 1.6180344478216817 |#


#|
3. Now using the the fixed point method of this section, we can compute the fixed point of x |-> 1 + 1 / x as 
|#

(define (fixed-point f first-guess)
  (define tolerance 0.0001)
  (define (close-enough a b)
    (< (abs (- a b)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough guess next)
          next
          (try next))))
  (try first-guess))


(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)
#| ===> 1.6180344478216817 

Thus, this proves that the fixed point of x |-> 1 + 1 / x is really the golden ratio..

|#






