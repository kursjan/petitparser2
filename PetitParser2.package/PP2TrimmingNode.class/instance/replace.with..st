transforming
replace: node with: anotherNode
	node == child ifTrue: [ child := anotherNode ].
	node == trimmer ifTrue: [ trimmer := anotherNode ].