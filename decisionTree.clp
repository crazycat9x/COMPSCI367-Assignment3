;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Program   : Aquarium fish diagnosis expert system ;;
;; Author    : Tien Nguyen Khac                      ;;
;; StudentID : 756505860                             ;;
;; UPI       : tngu281                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(deftemplate node "Decision tree node template"
  (slot identifier (type INTEGER))
  (slot content (type STRING))
  (multislot children (type INTEGER))
)

(defrule on-program-start "Print welcome & set current node to 1"
  (not (current-node ?))
  => 
    (reset)
    (printout
        t crlf
        "################################################################"      crlf
        "##   __  _       _           _               _                ##"      crlf
        "##  / _|(_)     | |         | |             | |               ##"      crlf
        "## | |_  _  ___ | |__     __| |  ___    ___ | |_  ___   _ __  ##"      crlf
        "## |  _|| |/ __|| '_ \\   / _` | / _ \\  / __|| __|/ _ \\ | '__| ##"   crlf
        "## | |  | |\\__ \\| | | | | (_| || (_) || (__ | |_| (_) || |    ##"    crlf
        "## |_|  |_||___/|_| |_|  \\__,_| \\___/  \\___| \\__|\\___/ |_|    ##" crlf
        "##                                                            ##" crlf
        "## I'll diagnose your aquarium fishes for you                 ##" crlf
        "## Just answer the following questions                        ##" crlf
        "################################################################" crlf
        crlf
    )
    (assert (current-node 1)
  )
)

(defrule program-has-not-ended "Traverse tree until reaching a leaf node"
  ?node <- (current-node ?id)
  (node
    (identifier ?id)
    (content ?message)
    (children $?children)
  )
  => 
    (if (= (length$ $?children) 0)
      then
        (printout
          t 
          "==================================" crlf
          "I have diagnosed your fishes with:" crlf
          "==================================" crlf
          ?message crlf
          crlf
          "Enter the following keys to:" crlf
          "----------------------------" crlf
          "r: restart" crlf
          "any other keys: exit" crlf
        )
        (bind ?control (read))
        (if (eq ?control r)
          then (retract ?node)
          else (exit)
        )
      else
        (printout t ?message ":" crlf)
        (bind ?input (read))
        (while 
          (or
            (not (integerp ?input))
            (eq (nth$ ?input $?children) nil)
          ) do
            (printout t ?message ":" crlf)
            (bind ?input (read))
        )
        (bind ?next (nth$ ?input $?children))
        (retract ?node)
        (assert (current-node ?next))
    )
)

(deffacts decision-tree "Adding nodes to the decision tree"
  ; NOTE:
  ; root node has an id of 1

  (node
      (identifier 1)
      (content "Is there an open wound? (1-Yes 2-No)")
      (children 2 3)
  )

  (node
      (identifier 2)
      (content "Does the wound appear to be caused by physical impact? (1-Yes 2-No)")
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
    (content "Are there open sores with red edges? (1-Yes 2-No)")
    (children 9 10)
  )

  (node
    (identifier 9)
    (content "Upon inspection with a magnefying glass are there worms inside the wound? (1-Yes 2-No)")
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
    (content "Are wounds small and round in shape? (1-Yes 2-No)")
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
)