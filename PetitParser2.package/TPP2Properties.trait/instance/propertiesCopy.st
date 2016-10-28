accessing - properties
propertiesCopy
	self properties isNil ifTrue: [ ^ nil ].
	^ self properties collect: #copy