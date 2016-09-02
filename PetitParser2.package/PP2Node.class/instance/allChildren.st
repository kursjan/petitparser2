enumerating
allChildren
"	^ PP2ChildrenVisitor new visit: self"

	"faster version than visitor:"
	| result |
	result := OrderedCollection new.
	self allChildrenDo: [ :parser | result addLast: parser ].
	^ result