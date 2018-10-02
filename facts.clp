; NOTE:
; root node has an id of 1

(node
    (identifier 1)
    (content "Is there an open wound? (1-Yes 2-No)")
    (children 2 3)
)

(node
    (identifier 2)
    (content "Physical contact wound? (1-Yes 2-No)")
    (children 7 8)
)

(node
    (identifier 3)
    (content "Characteristics? (1-[Red streaks] 2-[Tiny white spots] 3-[Red gills])")
    (children 4 5 6)
)
(node
    (identifier 4)
    (content "Bacterial infection")
)

(node
    (identifier 5)
    (content "Ick")
)

(node
    (identifier 6)
    (content "Fluke")
)

(node
  (identifier 7)
  (content "Fighting between fishes or sharp ornament")
)

(node
  (identifier 8)
  (content "Are there open sore with red edges? (1-Yes 2-No)")
  (children 9 10)
)


(node
  (identifier 9)
  (content "Visible worm in wound? (1-Yes 2-No)")
  (children 11 10)
)

(node
  (identifier 10)
  (content "Only on fish forehead? (1-Yes 2-No)")
  (children 12 13)
)

(node
  (identifier 11)
  (content "Does it has a fork like tail? (1-Yes 2-No)")
  (children 14 15)
)

(node
  (identifier 12)
  (content "Hole in head disease")
)

(node
  (identifier 13)
  (content "Are wound small and round in shape? (1-Yes 2-No)")
  (children 16 4)
)

(node
  (identifier 14)
  (content "Anchor worm")
)

(node
  (identifier 15)
  (content "Fluke")
)

(node
  (identifier 16)
  (content "Fish louse")
)