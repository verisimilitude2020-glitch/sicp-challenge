#|
An infinite continued fraction is an expression of the form 

          N1
f =   -----------------
      D1  +    N2
             ---------
             D2 + N3
                 -----
                 D3 + ... 

One way to approximate an infinite continued fraction is to truncate the expansion after a given number of terms. Such a truncation -- a so-called k-term finite continued fraction -- has the form as below. The below is a 3-term continued fraction

          N1
f =   -----------------
      D1  +    N2
             ---------
             D2 + N3
                 -----
                  D3

Suppose that n and d are procedures of one argument (the term index i) that return the Ni and Di of the terms of the continued fraction. Define a procedure cont-frac such that evaluating (cont-frac n d k) computes the value of the k-term finite continued fraction. Check your procedure by approximating 1/ϕ  using 

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           k)

for successive values of k. How large must you make k in order to get an approximation that is accurate to 4 decimal places?

|#



(define (cont-frac-recur n d k)
  (define (recur i)
    (if (= k i)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (recur (+ i 1))))))  
  (recur 1))



(cont-frac-recur (lambda (n) 1.0) (lambda (d) 1.0) 10)
#|

=>>>> 0.6179775280898876

From exercise 1.35, 
     1/ϕ = 0.618033813400125297547452192962
|#

(cont-frac-recur (lambda (n) 1.0) (lambda (d) 1.0) 12)
#|

=>>>> 0.6180257510729613

Thus for k = 12, we get the value of 1/ϕ accurate to 4 decimal places..

Let's now write cont-frac-recur as a iterative function
|#

(define (cont-frac n d k)
  (define (iter i result)
    (if (= i 0)
        result
        (iter (- i 1) (/ (n i) (+ (d i) result)))))   
  (iter k 0))


(cont-frac (lambda (n) 1.0) (lambda (d) 1.0) 12)

#|

=>>>> 0.6180257510729613

#|