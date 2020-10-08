#|
Observe that our model of computation allows for combinations whose operators are compound expressions. 
Use this observation to describe the behavior of the following procedure.
|#

(define (a-plus-abs-b a b)
	((if (> b 0) + -) a b)
	)

#|
==> 

if b is positive, it is added to a. 
If b is negative, it is subtracted from a. In effect its the absolute value of b that's subtracted from a.

For example
(a-plus-abs-b 5 10)
--> 15

(a-plus-abs-b -5 10)
--> 5

(a-plus-abs-b 5 -10)
--> 15

(a-plus-abs-b -5 -10)
--> 5
|#