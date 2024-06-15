#!/usr/bin/env cached-nix-shell
#| nix-shell will read the next lines no matter what, See: https://github.com/NixOS/nix/issues/2570
#!nix-shell --pure
#!nix-shell -p "sbcl"
#!nix-shell -i "sbcl --script"
#!nix-shell -I nixpkgs=https://nixos.org/channels/nixos-24.05/nixexprs.tar.xz
|#

;;; Library

(defmacro with-gensyms ((&rest names) &body body)
  `(let ,(loop for n in names collect `(,n (gensym)))
     ,@body))

;;; A test framework from Practical Common Lisp ch.8.

(defvar *test-name* nil)

(defmacro deftest (name parameters &body body)
  "Define a test function. Within a test function we can call
   other test functions or use 'check' to run individual test
   cases."
  `(defun ,name ,parameters
     (let ((*test-name* (append *test-name* (list ',name))))
      ,@body)))

(defun report-result (result form)
  "Report the results of a single test case. Called by 'check'."
  (format t "~:[FAIL~;pass~] ... ~a: ~a~%" result *test-name* form)
  result)

(defmacro combine-results (&body forms)
  "Combine the results (as booleans) of evaluating 'forms' in order."
  (with-gensyms (result)
    `(let ((,result t))
      ,@(loop for f in forms collect `(unless ,f (setf ,result nil)))
      ,result)))

(defmacro check (&body forms)
  "Run each expression in 'forms' as a test case"
  `(combine-results
    ,@(loop for f in forms collect `(report-result ,f ',f))))

;;; Application

(deftest test-+ ()
  (check
    (= (+ 1 2) 3)
    (= (+ 1 2 3) 6)
    (= (+ -1 -3) -4)))

(deftest test-arithmetic ()
  (combine-results (test-+)))

(test-arithmetic)
