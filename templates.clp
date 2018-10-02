(deftemplate node "Decision tree node"
  (slot identifier (type INTEGER))
  (slot content (type STRING))
  (multislot children (type INTEGER))
)