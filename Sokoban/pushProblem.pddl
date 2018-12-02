;; Move 2 boxes on expected location
(define (problem push)
    (:domain sokoban)
    (:objects 
        position1x1 position2x1 position3x1 position4x1 position1x2 position2x2 position3x2 position4x2 position1x3 position2x3 position3x3 position4x3
        man empty box1 box2
        row1 row2 row3 
        column1 column2 column3 column4)
    (:init
        (position position1x1) (position position2x1) (position position3x1) (position position4x1)
        (position position1x2) (position position2x2) (position position3x2) (position position4x2)
        (position position1x3) (position position2x3) (position position3x3) (position position4x3)
        (man man)
        (box box1) (box box2)
        (isEmpty empty)
        (column column1) (column column2) (column column3) (column column4)
        (row row1) (row row2) (row row3)
        
        (at empty position1x1) (at man position2x1)     (at empty position3x1) (at empty position4x1) 
        (at empty position1x2) (at box1 position2x2)     (at empty position3x2) (at empty position4x2)
        (at empty position1x3) (at empty position2x3)   (at box2 position3x3) (at empty position4x3)
        

        
        ;;------------------- HORIZONTAL-------------------------
        ;; Left to Right
        (adjenced position1x1 position2x1) 
        (adjenced position2x1 position3x1) 
        (adjenced position3x1 position4x1) 
        
        (adjenced position1x2 position2x2) 
        (adjenced position2x2 position3x2) 
        (adjenced position3x2 position4x2) 
        
        (adjenced position1x3 position2x3) 
        (adjenced position2x3 position3x3) 
        (adjenced position3x3 position4x3) 
        
        ;;Right to left
        (adjenced position2x1 position1x1)
        (adjenced position3x1 position2x1)
        (adjenced position4x1 position3x1)
        
        (adjenced position2x2 position1x2)
        (adjenced position3x2 position2x2)
        (adjenced position4x2 position3x2)
        
        (adjenced position2x3 position1x3)
        (adjenced position3x3 position2x3)
        (adjenced position4x3 position3x3)
        
        ;;------------------- Vertical-------------------------
        ;;Top down
        (adjenced position1x1 position1x2)
        (adjenced position2x1 position2x2) 
        (adjenced position3x1 position3x2) 
        (adjenced position4x1 position4x2) 
        
        (adjenced position1x2 position1x3)
        (adjenced position2x2 position2x3) 
        (adjenced position3x2 position3x3) 
        (adjenced position4x2 position4x3) 
        
        ;; Buttom up
        (adjenced position1x2 position1x1)
        (adjenced position2x2 position2x1)
        (adjenced position3x2 position3x1)
        (adjenced position4x2 position4x1)
        
        (adjenced position1x3 position1x2)
        (adjenced position2x3 position2x2)
        (adjenced position3x3 position3x2)
        (adjenced position4x3 position4x2)
        
        ;;----------------- Rows 1
        (isRow row1 position1x1 )
        (isRow row1 position2x1 )
        (isRow row1 position3x1 )
        (isRow row1 position4x1 )
        
        ;;------------------- row2
        
        (isRow row2 position1x2 )
        (isRow row2 position2x2 )
        (isRow row2 position3x2 )
        (isRow row2 position4x2 )        
        
        ;;------------------- row3
        
        (isRow row3 position1x3 )
        (isRow row3 position2x3 )
        (isRow row3 position3x3 )
        (isRow row3 position4x3 )        
        
        ;;----------------- column1
        (isColumn column1 position1x1)
        (isColumn column1 position1x2)
        (isColumn column1 position1x3)
        
        ;;----------------- column2
        (isColumn column2 position2x1)
        (isColumn column2 position2x2)
        (isColumn column2 position2x3)
        
        ;;----------------- column3
        (isColumn column3 position3x1)
        (isColumn column3 position3x2)
        (isColumn column3 position3x3)
        
        ;;----------------- column4
        (isColumn column4 position4x1)
        (isColumn column4 position4x2)
        (isColumn column4 position4x3)

    )
    (:goal
        (or
            (and 
                (at box1 position4x1)
                (at box2 position2x3)
                (at man position4x3)
            )
            (and 
                (at box2 position4x1)
                (at box1 position2x3)
                (at man position4x3)
            )
        )
    )
)
