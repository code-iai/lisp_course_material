;;; Welcome to Assignment 4 of the "Robot Programming with Lisp" course.

;;; We are back to the grid world from Assignment 2.
;;; This time the robot has a mobile base but it cannot fly.
;;; There are walls in the world, which are obstacles,
;;; and there is free space.

;;; Your assignment will be to implement a path finding algorithm
;;; for the robot and to visualize the resulting paths.

;;; ATTENTION: in this assignment you are not allowed to use any looping
;;; function such as LOOP, DOTIMES, DOLIST etc.
;;; Instead, please stick to mapping, searching, etc. and your own recursive functions.

(defvar *world*
  #(#(w w w w w w w w w w w w w w w)
    #(w g g g g g g w g g g w g g w)
    #(w g g g g g g w g g g w g g w)
    #(w w w w g w w w w g w w w g w)
    #(w g g g g g g g g g g g g g w)
    #(w w w w g w w w w w w g w w w)
    #(w g g w g w g g g w g g g g w)
    #(w g g w g w g g g w g g g g w)
    #(w g g g g g g g g w g g g g w)
    #(w g g w g w g g g w g g g g w)
    #(w w w w g w w w w w w w w w w)
    #(w g g w g w g g g w g g g g w)
    #(w g g g g w g g g w g g g g w)
    #(w g g w g g g g g w g g g g w)
    #(w w w w w w w w w w w w w w w))
  "2D grid world.
The following symbols are used to represent things in the world:
- W for wall cell
- G for ground
- R for robot.")

(defun visualize-world (world &optional path)
  "Prints the `world' to the standard output stream.
Walls are visualized as █, ground as free space, robot as ☠ and path as ⚡.
`path' is a list of coordinates that should be overlaid on `world' when visualizing."
  (dotimes (row (length world) world)
    (dotimes (column (length (elt world 0)))
      (princ
       (if (and path (member (list row column) path :test #'equalp))
           "⚡"
           (case (elt (elt world row) column)
             (w "█")
             (g " ")
             (r "☠")))))
    (format t "~%")))

(defun find-robot-in-world (world)
  "Looks for symbol 'r in the `world'.
Returns a list with coordinates: (row column).
If there are multiple 'r-s in the `world' returns coordinates of one of them."
  ;; TODO: implement
  ;; HINT: use the functions POSITION and POSITION-IF-NOT. E.g.:
  ;;       first you can go through the rows of `world' to find the cells with 'r,
  ;;       then you can go over the resulting column indices to find the coordinates.

  )

(defun spawn-robot (world)
  "Spawns the robot at a random free space in the `world'.
There can only be one robot at a time in the world.
Returns the new `world' state.
The logic of this function is: pick a random position on the map then
move into four directions until a free spot is found."
  (labels ((already-checked-p (row-to-check column-to-check already-checked-list)
             ;; Checks if the list (`row-to-check' `column-to-check')
             ;; is a member of `already-checked-list'.
             ;; -P in ALREADY-CHECKED-P stands for "predicate",
             ;; i.e., this is a boolean function.
             ;; `row-to-check' and `column-to-check' are indices of `world'.
             ;; `already-checked-list' is a list of indices, e.g.:
             ;; ((some-row some-column) (some-other-row some-other-column))

             ;; TODO: implement
             ;; HINT: you can use the function MEMBER

             )
           (find-free-spot (row-to-check column-to-check
                            &optional (already-checked-list '()))
             ;; Starts with coordinates (`row-to-check' `column-to-check')
             ;; and goes through the world in 4 directions (north, west, ...)
             ;; trying to find a free spot.
             ;; The searching algorithm is depth-first-search.
             (when (and
                    ;; first we need to check for return conditions:
                    ;; are the indices within bounds and
                    ;; are we not in an endless loop

                    ;; TODO: implement

                    )
               (format t "Checking coordinates (~a ~a): ~a~%"
                       row-to-check column-to-check
                       (elt (elt world row-to-check) column-to-check))
               ;; if the coordinate is not free space,
               ;; continue searching in 4 directions and stop once any succeeds,
               ;; otherwise, return the new list of found coordinates

               ;; TODO: implement

               )))

    (let* ((starting-point-row (random (length world)))
           (starting-point-column (random (length (elt world 0))))
           (new-robot-coordinates (find-free-spot starting-point-row starting-point-column))
           (current-robot-coordinates (find-robot-in-world world)))
      (format t "Spawning robot at new coordinates ~a~%" new-robot-coordinates)

      ;; Reset the world state

      ;; TODO: implement

      (visualize-world world)
      world)))

(defun move-robot (world row column)
  "Searches for a path for the robot to go from its current position
to coordinate (row column).
Uses the depth-first-search algorithm to find the path.
The robot can only move in 4 directions: (north, west, south, east),
i.e., not diagonally."
  (labels ((find-path (current-coords goal-coords &optional the-path-list)
             ;; Searches for a path from `current-coords' to `goal-coords'.
             ;; Coordinates are a list of form (ROW COLUMN).
             ;; `the-path-list' is a list of already traversed coordinates
             ;; Returns the found path or NIL if no path was found.

             ;; (format t "searching for ~a -> ~a~%path: ~a~%~%"
             ;;         current-coords goal-coords the-path-list)
             (unless (or
                      ;; check for return cases: any bad situation

                      ;; TODO: implement

                      )
               (let ((the-path-list (cons current-coords the-path-list)))
                 ;; if already at the goal return the path
                 ;; otherwise, check if any of the 4 directions maybe succeed
                 ;; return once any succeeded

                 ;; TODO: implement

                 ))))

    ;; Check if (`row' `column') are free space at all, otherwise RETURN-FROM.

    ;; TODO: implement

    ;; Search for path.
    (let* ((current-coords (find-robot-in-world world))
           (path (find-path current-coords (list row column))))
      (visualize-world world path)
      ;; If path found, move the robot.
      ;; If no path found print an according statement.

      ;; TODO: implement

      )))

(defun test-me ()
  (let* ((world *initial-world*)
         (current-robot-coordinates (find-robot-in-world world)))

    ;; set the robot on (1 1)
    (when current-robot-coordinates
      (setf (elt (elt world (first current-robot-coordinates))
                 (second current-robot-coordinates))
            'g))
    (setf (elt (elt world 1) 1) 'r)

    ;; check some coordinates if path exists
    (mapc (lambda (coordinates path-exists?)
            (let ((move-succeeded
                    (move-robot world (first coordinates) (second coordinates))))
              (format t "Moving robot to (~a ~a) ~a, ~a.~%"
                      (first coordinates) (second coordinates)
                      (if move-succeeded "succeeded" "did not succeed")
                      (if (eql (null move-succeeded) path-exists?)
                          "something's wrong :(" "all cool :)"))))
          '((1 1) (1 2) (0 0) (13 13) (13 1)) '(t t nil nil t))))
