(define (problem hard1)
    (:domain strips-sliding-tile)
    (:objects tile1 tile2 tile3 tile4 tile5 tile6 tile7 tile8 tile9 tile10 tile11 tile12 tile13 tile14 tile15 position1 position2 position3 position4)
    (:init
        (tile tile1) (tile tile2) (tile tile3) (tile tile4) (tile tile5) (tile tile6) (tile tile7) (tile tile8) (tile tile9) (tile tile10) (tile tile11) (tile tile12) (tile tile13) (tile tile14) (tile tile15)
        (position position1) (position position2) (position position3) (position position4)
        (inc position1 position2) (inc position2 position3) (inc position3 position4)
        (dec position4 position3) (dec position3 position2) (dec position2 position1)
         
        (at tile8 position1 position1)  (at tile7 position2 position1)  (at tile6 position3 position1)  (at tile9 position4 position1)
        (blank position1 position2)     (at tile4 position2 position2)  (at tile1 position3 position2)  (at tile10 position4 position2)
        (at tile2 position1 position3)  (at tile5 position2 position3)  (at tile3 position3 position3)  (at tile11 position4 position3)
        (at tile12 position1 position4) (at tile13 position2 position4) (at tile14 position3 position4) (at tile15 position4 position4)
    )
    (:goal
        (and 
            (at tile1 position1 position1) (at tile2 position2 position1) (at tile3 position3 position1) (at tile4 position4 position1)
            (at tile5 position1 position2) (at tile6 position2 position2) (at tile7 position3 position2) (at tile8 position4 position2)
            (at tile9 position1 position3) (at tile10 position2 position3) (at tile11 position3 position3) (at tile12 position4 position3)
            (at tile13 position1 position4) (at tile14 position2 position4) (at tile15 position3 position4)
	))
)
