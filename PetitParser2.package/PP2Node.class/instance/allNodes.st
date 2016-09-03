enumerating
allNodes
"	^ PP2ChildrenVisitor new visit: self"

	"faster version than visitor:"
	| result |
	result := OrderedCollection new.
	self allNodesDo: [ :parser | result addLast: parser ].
	^ result