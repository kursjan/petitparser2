accessing - globals
globalAt: aKey ifAbsent: aBlock
	"Answer the global property value associated with aKey or, if aKey isn't found, answer the result of evaluating aBlock."
	
	^ self globals isNil
		ifTrue: [ aBlock value ]
		ifFalse: [ self globals at: aKey ifAbsent: aBlock ]