(define (domain sokoban)
    (:requirements :strips)
    (:predicates
        (man ?man)
        (box ?box)
        (position ?position)
        (isEmpty ?empty)
        (at ?object ?position)
        (adjenced ?position1 ?position2)
        (isColumn ?column ?position)
        (isRow ?row1 ?position1)
        (column ?column)
        (row ?row1)
    )

    (:action move-man
        :parameters (?man ?empty ?positionFrom ?positionTo)
        :precondition (and
		   (man ?man) (position ?positionFrom) (position ?positionTo)  (isEmpty ?empty)
		   (at ?empty ?positionTo) (at ?man ?positionFrom) (adjenced ?positionFrom ?positionTo)
	    )
        :effect ( and 
            (not (at ?empty ?positionTo)) (not (at ?man ?positionFrom))
		    (at ?man ?positionTo) (at ?empty ?positionFrom)
	    )
    )

    (:action push-box-horizontal
        :parameters (?man ?empty ?box ?positionMan ?positionBox ?positionEmpty ?row)
        :precondition (and
		   (man ?man) (isEmpty ?empty) (box ?box) (position ?positionMan) (position ?positionBox) (position ?positionEmpty) (row ?row)
		   (at ?empty ?positionEmpty) (at ?man ?positionMan) (at ?box ?positionBox)
		   (isRow ?row ?positionEmpty) (isRow ?row ?positionMan) (isRow ?row ?positionBox)
		   (adjenced ?positionEmpty ?positionBox) (adjenced ?positionMan ?positionBox)
	    )
        :effect ( and 
            (not (at ?empty ?positionEmpty)) (not (at ?man ?positionMan)) (not (at ?box ?positionBox))
            (at ?empty ?positionMan) (at ?man ?positionBox) (at ?box ?positionEmpty)
	    )
    )
    
    (:action push-box-vertical
        :parameters (?man ?empty ?box ?positionMan ?positionBox ?positionEmpty ?column)
        :precondition (and
		   (man ?man) (isEmpty ?empty) (box ?box) (position ?positionMan) (position ?positionBox) (position ?positionEmpty) (column ?column)
		   (at ?empty ?positionEmpty) (at ?man ?positionMan) (at ?box ?positionBox)
		   (isColumn ?column ?positionEmpty) (isColumn ?column ?positionMan) (isColumn ?column ?positionBox)
		   (adjenced ?positionEmpty ?positionBox) (adjenced ?positionMan ?positionBox)
	    )
        :effect ( and 
            (not (at ?empty ?positionEmpty)) (not (at ?man ?positionMan)) (not (at ?box ?positionBox))
            (at ?empty ?positionMan) (at ?man ?positionBox) (at ?box ?positionEmpty)
	    )
    )
)
