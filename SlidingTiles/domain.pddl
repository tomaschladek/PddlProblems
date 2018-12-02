(define (domain strips-sliding-tile)
    (:requirements :strips)
    (:predicates
        (tile ?tile) ;; Tile is carring number
        (position ?position) ;; position X or Y
        (at ?tile ?positionX ?positionY) ;; tile T is on corrdinates X and Y
        (blank ?positionX ?positionY)
        (inc ?positionLesser ?positionGreater) 
        (dec ?positionGreater ?positionLesser))


    ;; ...|X|...        ....|4|...
    ;;---------- ==>    ----------
    ;;....|4|...        ....|X|...
    (:action move-up
        :parameters (?tile ?positionX ?positionY ?blankY)
        :precondition (and
            (tile ?tile) (position ?positionX) (position ?positionY) (position ?blankY) ;; Items
            (dec ?blankY ?positionY) ;; is blank tile is higher => Tile will be moved higher
            (blank ?positionX ?blankY) ;; confirming position of blank tile
            (at ?tile ?positionX ?positionY)) ;; confirming position of tile
        :effect (and 
            (not (blank ?positionX ?blankY)) (not (at ?tile ?positionX ?positionY)) ;; original state is removed
		    (blank ?positionX ?positionY) (at ?tile ?positionX ?blankY))) ;; new state is added => swap blank and tile positions

    (:action move-down
        :parameters (?tile ?positionX ?positionY ?blankY)
        :precondition (and
		    (tile ?tile) (position ?positionX) (position ?positionY) (position ?blankY)
		    (inc ?blankY ?positionY) (blank ?positionX ?blankY) (at ?tile ?positionX ?positionY))
        :effect (and (not (blank ?positionX ?blankY)) (not (at ?tile ?positionX ?positionY))
		    (blank ?positionX ?positionY) (at ?tile ?positionX ?blankY)))

    (:action move-left
        :parameters (?tile ?positionX ?positionY ?blankX)
        :precondition (and
		    (tile ?tile) (position ?positionX) (position ?positionY) (position ?blankX)
		    (dec ?blankX ?positionX) (blank ?blankX ?positionY) (at ?tile ?positionX ?positionY))
        :effect (and (not (blank ?blankX ?positionY)) (not (at ?tile ?positionX ?positionY))
		    (blank ?positionX ?positionY) (at ?tile ?blankX ?positionY)))

    (:action move-right
        :parameters (?tile ?positionX ?positionY ?blankX)
        :precondition (and
		    (tile ?tile) (position ?positionX) (position ?positionY) (position ?blankX)
		    (inc ?blankX ?positionX) (blank ?blankX ?positionY) (at ?tile ?positionX ?positionY))
        :effect (and (not (blank ?blankX ?positionY)) (not (at ?tile ?positionX ?positionY))
		    (blank ?positionX ?positionY) (at ?tile ?blankX ?positionY)))
  )
