#|
A continued fraction representation of the tangent function was published in 1770 by the German mathematician J.H. Lambert:

                         x
 tan x  =       ---------------
                             x^2
                     1 -   --------
                              x^2
                         3 - --------
                              5 - ....    

where x is in radians. Define a procedure (tan-cf x k) that computes an approximation to the tangent function based on Lambert's formula. K specifies the number of terms to compute, as in exercise 1.37.

=====> 

|#


(define (cont-frac-recur n d k)
  (define (recur i)
    (if (= k i)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (recur (+ i 1))))))  
  (recur 1))

(define (tan-cf x k)
    (cont-frac-recur (lambda(n) (if (= n 1) x (- (* x x)))) (lambda (d) (- (* 2 d) 1)) k)
)


(tan-cf 1.0 15)

#|
===> 1.557407724654902

1. Here the numerator is x for the first term and is (- x^2) for the second term onwards
2. Denominator is odd number so it can be computed as (2 * ith term)  - 1

The tan-cf procedure just gives a call to cont-fact-recur function. The key to the solution is formulating those lambda (n) and lambda(d) methods.


|#




