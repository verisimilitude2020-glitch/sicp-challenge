#|
Suppose we defined the procedure 

(define (f g)
    (g 2)
)

Then we have

(f square)
--> 4

(f (lambda (z) (* z (+ z 1))))
--> 6

What happens if we perversely ask the interpreter to evaluate the combination (f f)
|#

#| ==============> |#

(define (f g)
    (g 2)
)

(f f)

#| Substituting the argument 'f' in place of 'g' in the above definition, we get |#

(f 2)

#| Again substituting  'g'with 2  in the above definition of 'f' |#

(2 2)

#| This is incorrect, 2 is a number and is not a procedure. This will throw an error saying the same. |#