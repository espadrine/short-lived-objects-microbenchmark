#!/usr/bin/sbcl --script
(defstruct point x y)
(let ((total 0))
  (loop repeat 1000000 do
    (let ((p (make-point :x 2 :y 3)))
      (setf total (+ total (point-x p) (point-y p)))))
  (format t "~a~%" total))
