#|
In 1737, the Swiss mathematician Leonhard Euler published a memoir De Fractionibus Continuis, which included a continued fraction expansion for e - 2, where e is the base of the natural logarithms. In this fraction, the Ni are all 1, and the Di are successively 1, 2, 1, 1, 4, 1, 1, 6, 1, 1, 8, .... Write a program that uses your cont-frac procedure from exercise 1.37 to approximate e, based on Euler's expansion
|#


(define (cont-frac n d k)
  (define (iter i result)
    (if (= i 0)
        result
        (iter (- i 1) (/ (n i) (+ (d i) result)))))   
  (iter k 0))


(define (d i)
    (if (or (= (remainder i 3) 0) (= (remainder i 3) 1))
        1
        (* 2 (+ (quotient i 3) 1))))



#| 
The key in this solution was to determine the d procedure that gives rise to the below pattern

ID    |   Pattern
1            1   
2            2
3            1
4            1
5            4
6            1 
7            1
8            6  
9            1
10           1
11           8

Thus, the ith element is

I]   1 if the remainder of i and 3 is either 1 or 0

II]  Else (2 * ((integer division of i and 3) + 1)) is the value.


Now, if we make the below call
|#

(cont-frac (lambda (n) 1.0) d 12)

#| 
==>>>>> 0.7182818229439497 

Per the question, the continued fraction expansion gives (e - 2). So our answer is correct.
|#