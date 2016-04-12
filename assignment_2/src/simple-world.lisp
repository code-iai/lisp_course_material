;;; Welcome to Assignment 2 of the "Robot Programming with Lisp" course.

;;; In this assignment you are a robot living in a 2D grid world.
;;; The world consist of firm ground, where you can stand, and water,
;;; where you drown.
;;; From your current location you can fly anywhere but you can only land
;;; on firm ground.
;;; There are little treasures spread around the world.
;;; Your goal is to collect all the treasure.

;;; Below is a sceleton code of the program. You can add new variables and
;;; new helper functions. The main function is DISCOVER-WORLD.

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
- W for water cell
- G for firm ground
- R for robot
- T for treasure.")

(defvar *treasure-num* 10
  "Number of treasure cells to spawn in the world")

(defvar *fuel-num* 50
  "Number of fuel cells of the robot")

(defun initialize-world ()
  "This function initializes the world.
1. It throws treasure randomly around the world. If the treasure falls into water it disappears.
Overall, there should be *treasure-num* number of treasure lying around on the ground after
this function is called.
2. It spawns the robot on a random place on the ground.
3. It resets all global variables so that one could play the treasure hunting game multiple
times in a row."
  ;; ToDo: implement
  )

(defun visualize-world ()
  "Prints the *world* to the standard output stream.
Water is visualized as ♒, ground as free space, treasure as ☆, robot as ✈"
  ;; ToDo: implement
  )

(defun move-robot (x y)
  "Flies the robot to the grid cell (x, y) in the world. Indexing starts from 0.
If the cell is water or treasure, i.e., anything except firm ground, nothing happens and
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
The robot can only fly *fuel-num* times.
The robot has access to the world state *world* and can read the coordinates of treasure."
  ;; ToDo: implement
  )
