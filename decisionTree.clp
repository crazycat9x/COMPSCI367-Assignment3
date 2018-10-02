(defrule initialize
  (not (current-node ?))
  => (assert (current-node 1)
  )
)

(defrule process
  ?node <- (current-node ?id)
  (node
    (identifier ?id)
    (node-type ?type)
    (content ?message)
    (children $?children)
  )
  => 
    (if (eq ?type question)
      then
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
      else
        (printout t ?message crlf)
    )
)