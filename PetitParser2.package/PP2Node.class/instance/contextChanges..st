analysis - context
contextChanges: aPP2CaResult
	self assert: (aPP2CaResult isKindOf: PP2CcResult).
	^ self propertyAt: #contextChanges put: aPP2CaResult