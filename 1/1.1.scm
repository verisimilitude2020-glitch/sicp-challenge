#|
Exercise 1.1

Below is a sequence of expressions. What is the result printed by the interpreter in response to each expressions?
Assume that sequence is evaluated in the order it is printed.


===>

a. 10
=> 10

b. (+ 5 3 4)
==> 12

c. (- 9 1)
==> 8

d. (/ 6 2)
==> 4

e. (+ (* 2 4) (- 4 6))
==> 6

f. (define a 3)
==> No output, a is assigned the value 3

g. (define b (+ a 1))
==> No output, b is assigned the value 4

h. (+ a b  (* a b))
==> 19

i. (= a b)
==> #f

j. (if (and (> b a) (< b (* a b)))
    b
    a)
==> 4

h. (cond ((= a 4) 6)
         ((= b 4) (+ 6 7 a))
      (else 25))
==> 16

i. (+ 2 (if (> b a) b a))
==> 6

j. (* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1))
==> 16
|#
