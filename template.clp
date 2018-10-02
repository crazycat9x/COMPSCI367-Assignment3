(deftemplate node "Decision tree node"
  (slot identifier (type INTEGER))
  (slot node-type (allowed-symbols question decision))
  (slot content (type STRING))
  (multislot children)
)