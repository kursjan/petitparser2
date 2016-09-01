comparing
localEquals: anotherNode
	"
		This method is supposed to be overriden by children
	"

	self == anotherNode ifTrue: [ ^ true ].
	self class == anotherNode class ifFalse: [ ^ false ].
	
	"
		JK: properties? Most probably not, they can contain first/follow etc.
		Cherrypick manually the ones you care about.
	"
	self name = anotherNode name ifFalse: [ ^ false ].

	"JK: strategy? Probably not"
	^ true