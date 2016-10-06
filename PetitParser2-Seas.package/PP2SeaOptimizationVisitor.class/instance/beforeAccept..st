visiting
beforeAccept: context
	self isRoot ifTrue: [ rootNode := context node ].
