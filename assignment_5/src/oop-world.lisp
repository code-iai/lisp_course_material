;;; Welcome to Assignment 5 of the "Robot Programming with Lisp" course.

;;; We are back with the grid world.
;;; Only this time there will be no global variables or other similar ugly things.
;;; Your task is to define classes to represent the structure of the world,
;;; initialize instances of classes and implement a generic function for them.
;;; We will represent our world in a very similar way to how they are represented
;;; in computer game physics engines, only, of course, much simpler.

;;; Our world is a 2D grid world inhabited by robots and obstacles.
;;; Robots and obstacles have coordinates in the world,
;;; so first define a structure called COORDINATE that will look like this:
;;;      -----------------
;;;          COORDINATE
;;;      -----------------
;;;       x | integer | 0
;;;       y | integer | 0
;;;      -----------------
;;; where X is the name of the slot, INTEGER is the type and 0 is the default value.

;; TODO: structure "coordinate"

;;; Next is a representation of the world. It will be a class named GRID-WORLD:
;;;      -------------------------------------------
;;;          GRID-WORLD
;;;      -------------------------------------------
;;;       robots    | hash-table | empty hash table
;;;       obstacles | list       | empty list
;;;      -------------------------------------------
;;; ROBOTS is a hash table where the key is the name of the robot and
;;; the value is a ROBOT object instance (see definition of ROBOT below).
;;; OBSTACLES is a list of OBSTACLE objects (also see below).
;;; Each slot should have a getter and setter of the same name as the slot.
;;; Use the specifier ":type" to specify the type of the slot.
;;; Also, make sure you document each slot using the ":documentation" specifier.
;;; The class itself should also have a documentation, e.g.:
;;; (defclass some-empty-class ()
;;;           ()
;;;           (:documentation "empty class"))

;; TODO: class "grid-world"

;;; Next is a parent class ENTITY and its two child classes: ROBOT and OBSTACLE:
;;;      -------------------------------------------
;;;          ENTITY
;;;      -------------------------------------------
;;;       coord    | coordinate | empty (default) coordinate
;;;       world    | grid-world | NIL
;;;      -------------------------------------------
;;;
;;;      -------------------------------------------
;;;          OBSTACLE  (inherited from ENTITY)
;;;      -------------------------------------------
;;;      -------------------------------------------
;;;
;;;      -------------------------------------------
;;;          ROBOT   (inherited from ENTITY)
;;;      -------------------------------------------
;;;       name    | symbol | NIL
;;;      -------------------------------------------
;;;
;;; Don't forget the getters and setters and the doc strings.

;; TODO: classes "entity", "obstacle", "robot".

;;; Final data structure is a drawing window, similar to the OpenGL rendering window,
;;; that will collect information about the world for visualizing it.

(defclass drawing-window ()
  ((start-x :type integer
            :initform 0
            :initarg :start-x
            :accessor start-x)
   (start-y :type integer
            :initform 0
            :initarg :start-y
            :accessor start-y)
   (length-x :type integer
             :initform 10
             :initarg :length-x
             :accessor length-x)
   (length-y :type integer
             :initform 10
             :initarg :length-y
             :accessor length-y)
   (grid :type simple-array
         :accessor grid))
  (:documentation "Contains an 2D array that will be filled with symbols for visualization.
The grid will be printed to the output stream.
Only those entities in the world will be visualized that have their coordinates
within (START-X, START-Y) and (START-X + LENGTH-X, START-Y + LENGTH-Y)."))

(defmethod initialize-instance :after ((window drawing-window) &key)
  "Initializes the grid of given dimensions."
  (with-slots (length-x length-y grid) window
    (setf grid (make-array (list length-x length-y)
                           :initial-element '_))))

(defun print-window (window)
  (declare (type drawing-window window))
  (with-slots (grid length-x length-y) window
    (loop for i from 0 below length-x
          do (loop for j from 0 below length-y
                   do (format t "~a" (aref grid i j)))
             (format t "~%"))))


;; TODO: custom error ROBOT-NAME-INVALID, see the function below.

(defun add-robot-to-world (name coordinate world)
  "Adds a new robot called `name' with coordinate `coordinate' to world `world'.
Namely, adds it to world's ROBOTS hash table, where `name' will be the key.
Makes sure that `name' has only one letter in it,
`name' will be used for visualizing the robot on the grid.
Also, `name' should not be 'X, as 'X will be used for visualizing obstacles.
If `name' is not one letter or is an 'X, throws an error ROBOT-NAME-INVALID.
You need to define that error class yourself."
  (declare (type symbol name)
           (type coordinate coordinate)
           (type grid-world world))
  ;; TODO
  )

(defun add-obstacle-to-world (coordinate world)
  "Adds a new obstacle with coordinate `coordinate' to `world'.
Namely, adds it to world's OBSTACLES list.
HINT: A robot and an obstacle can have the same coordinate in the `world'
 (which represents a collision in computer game physics engines)."
  (declare (type coordinate coordinate)
           (type grid-world world))
  ; TODO
  )


;;; Now we define a generic function ADD-TO-WINDOW that adds representations
;;; of entities in the world to a drawing window.

(defgeneric add-to-window (window entity)
  (:documentation "Adds a representation of entity to the corresponding
coordinate in the grid of the window.
If the entity is outside of boundaries does nothing."))

;; TODO: Define a general method for any entity and window that is not supported
;;       that would print a warning statement.

;; TODO: Define the method ADD-TO-WINDOW for entities of type ROBOT and OBSTACLE.
;;       For a ROBOT, a symbol with its name is added to the grid.
;;       For OBSTACLE-s add an 'X.


;;; Finally, we need to visualize the whole world.

(defun visualize-world (world window)
  "Visualizes the world. For that, adds all the obstacles and robots from
the `world' to `window' and prints the `window'."
  (declare (type grid-world world)
           (type drawing-window window))
  ;; TODO: for all entities in the world call ADD-TO-WINDOW then call PRINT-WINDOW.
  )


(defun test-me ()
  "Creates a world. Fills it with obstacles with the coordinates of the grid world
from Assignment 4. Also creates 5 different robots with different randomly generated coordinates
in this world (ranging in {Row in [0; 14] and Col in [0; 14]}),
making sure they're not sitting on obstacles.
Creates a drawing window for the coordinates {Row in [5; 10], Col in [0; 9]} and visualizes
the world using that window."
  (let ((world (make-instance 'grid-world))
        (window ;; TODO: initialize the WINDOW as described in the doc string
          ))
    ;; TODO: add the obstacles
    ;; TODO: add 5 robots with different names on random places not on obstacles
    (visualize-world world window)))


;; ███████████████
;; █      █   █  █
;; █      █   █  █
;; ████ ████ ███ █
;; █             █
;; ████ ██████ ███
;; █  █ █   █    █
;; █  █ █   █    █
;; █        █    █
;; █  █ █   █    █
;; ████ ██████████
;; █  █ █   █    █
;; █    █   █    █
;; █  █     █    █
;; ███████████████
