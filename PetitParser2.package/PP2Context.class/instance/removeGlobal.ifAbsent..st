accessing-globals
removeGlobal: aKey ifAbsent: aBlock
	"Remove the global property with aKey. Answer the value or, if aKey isn't found, answer the result of evaluating aBlock."
	
	| answer |
	globals isNil ifTrue: [ ^ aBlock value ].
	answer := globals removeKey: aKey ifAbsent: aBlock.
	globals isEmpty ifTrue: [ globals := nil ].
	^ answer