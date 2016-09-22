accessing - properties
removeProperty: aKey ifAbsent: aBlock
	"Remove the property with aKey. Answer the value or, if aKey isn't found, answer the result of evaluating aBlock."
	
	| answer |
	self properties isNil ifTrue: [ ^ aBlock value ].
	answer := self properties removeKey: aKey ifAbsent: aBlock.
	self properties isEmpty ifTrue: [ self properties: nil ].
	^ answer