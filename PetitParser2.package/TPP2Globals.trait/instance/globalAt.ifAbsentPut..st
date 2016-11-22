accessing - globals
globalAt: aKey ifAbsentPut: aBlock
	"Answer the global property associated with aKey or, if aKey isn't found store the result of evaluating aBlock as new value."
	
	^ self globalAt: aKey ifAbsent: [ self globalAt: aKey put: aBlock value ]