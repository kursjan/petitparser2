visiting
allNodes
	| result |
	result := OrderedCollection new.
	self allNodesDo: [ :parser | result addLast: parser ].
	^ result