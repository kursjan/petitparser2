accessing - properties
propertyAt: aKey ifAbsent: aBlock
	"Answer the property value associated with aKey or, if aKey isn't found, answer the result of evaluating aBlock."
	
	^ self properties isNil
		ifTrue: [ aBlock value ]
		ifFalse: [ self properties at: aKey ifAbsent: aBlock ]