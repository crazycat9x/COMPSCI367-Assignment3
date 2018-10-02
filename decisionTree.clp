(defrule initialize
  (not (current-node ?))
  => 
    (printout
        t crlf
        "################################################" crlf
        "## I'll diagnose your aquarium fishes for you ##" crlf
        "## Just follow the provided instruction       ##" crlf
        "################################################" crlf
        crlf
    )
    (assert (current-node 1)
  )
)

(defrule process
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
          t crlf
          "I have diagnosed your fishes with:" crlf
          ?message crlf
          crlf
          "Enter the following keys to:" crlf
          "r: restart" crlf
          "any other keys: exit" crlf
        )
        (bind ?control (read))
        (if (eq ?control r)
          then (retract ?node)
        )
      else
        (printout t ?message ":" crlf)
        (bind ?input (read))
        (while 
          (or
            (not (integerp ?input))
            (eq (nth$ ?input $?children) nil)
          )
            (printout t ?message ":" crlf)
            (bind ?input (read))
        )
        (bind ?next (nth$ ?input $?children))
        (retract ?node)
        (assert (current-node ?next))
    )
)