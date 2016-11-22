accessing - globals
removeGlobal: aKey ifAbsent: aBlock
	"Remove the global property with aKey. Answer the value or, if aKey isn't found, answer the result of evaluating aBlock."
	
	| answer |
	self globals isNil ifTrue: [ ^ aBlock value ].
	answer := self globals removeKey: aKey ifAbsent: aBlock.
	self globals isEmpty ifTrue: [ self globals: nil ].
	^ answer