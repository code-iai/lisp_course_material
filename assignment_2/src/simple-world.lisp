;;; Welcome to Assignment 2 of the "Robot Programming with Lisp" course.

;;; In this assignment you are a robot living in a 2D grid world.
;;; The world consist of ground, where you can stand, and walls,
;;; where you cannot.
;;; From your current location you can fly anywhere but you can only land
;;; on the ground (not walls).
;;; There are little treasures spread around the world.
;;; Your goal is to collect all the treasure.

;;; Below is a sceleton code of the program. You can add new variables and
;;; new helper functions. The main function is DISCOVER-WORLD.

;;; NOTE TO SELF: it's probably better to teach the local variables from the beginning

(defvar *world*
  #2A((w g g g g g w g g g w g g g)
      (w g g g g g w g g g w g g g)
      (w w w g w w w w g w w w w g)
      (g g g g g g g g g g g g g g)
      (w w w g w w w w w w g w w w)
      (g g w g w g g g w g g g w w)
      (g g w g w g g g w g g g w w)
      (g g g g g g g g w g g g w w)
      (g g w g w g g g w w w w w w)
      (w w w g w w w w w w w w w w)
      (g g w g w g g g w w w w w w)
      (g g g g w g g g w w w w w w)
      (g g w g g g g g w w w w w w))
  "2D grid world.
The following symbols are used to represent things in the world:
- W for wall cell
- G for ground
- R for robot
- T for treasure.")

(defun initialize-walls ()
  "Cleans the *world* array and initializes the walls and the ground."
  (setf *world* (make-array '(13 14) :initial-element 'g))
  (mapcar (lambda (x-y)
            (setf (aref *world* (first x-y) (second x-y)) 'w))
          '((0 0) (0 6) (0 10)
            (1 0) (1 6) (1 10)
            (2 0) (2 1) (2 2) (2 4) (2 5) (2 6) (2 7) (2 9) (2 10) (2 11) (2 12)
            (4 0) (4 1) (4 2) (4 4) (4 5) (4 6) (4 7) (4 8) (4 9) (4 11) (4 12) (4 13)
            (5 2) (5 4) (5 8) (5 12) (5 13)
            (6 2) (6 4) (6 8) (6 12) (6 13)
            (7 8) (7 12) (7 13)
            (8 2) (8 4) (8 8) (8 9) (8 10) (8 11) (8 12) (8 13)
            (9 0) (9 1) (9 2) (9 4) (9 5) (9 6) (9 7) (9 8) (9 9) (9 10) (9 11) (9 12) (9 13)
            (10 2) (10 4) (10 8) (10 9) (10 10) (10 11) (10 12) (10 13)
            (11 4) (11 8) (11 9) (11 10) (11 11) (11 12) (11 13)
            (12 2) (12 8) (12 9) (12 10) (12 11) (12 12) (12 13))))

(defconstant +treasure-num+ 10
  "Number of treasure cells to spawn in the world")

(defconstant +fuel-num+ 50
  "Number of fuel cells of the robot")

(defun initialize-world ()
  "This function initializes the world.
1. It throws treasure randomly around the world. If the treasure falls only a wall,
you cannot collect it from there, so a wall stays a wall.
Overall, there should be +treasure-num+ number of treasure lying around on the ground after
this function is called.
2. It spawns the robot on a random place on the ground.
3. It resets all global variables so that one could play the treasure hunting game multiple
times in a row."
  ;; ToDo: implement
  )

(defun visualize-world ()
  "Prints the *world* to the standard output stream.
Walls are visualized as █, ground as free space, treasure as $, robot as ☠"
  ;; ToDo: implement
  )

(defun move-robot (x y)
  "Flies the robot to the grid cell (x, y) in the world. Indexing starts from 0.
If the cell is wall or treasure, i.e., anything except ground, nothing happens and
the function returns NIL. The same also if `x' and `y' are outside the world boundaries.
If the robot moves, it loses one fuel cell.
This function can alter the world state (value of *world*)."
  ;; ToDo: implement
  )

(defun collect-treasure ()
  "The robot can collect treasures that are 1 cell far away from it, also diagonally.
One call to this function collects all the treasures in reach. This function can alter the
world state (value of *world*)."
  ;; ToDo: implement
  )

(defun discover-world ()
  "Autonomously flies the robot in the world until all the treasure is collected.
The robot can only fly +fuel-num+ times.
The robot has access to the world state *world* and can read the coordinates of treasure."
  ;; ToDo: implement
  )
