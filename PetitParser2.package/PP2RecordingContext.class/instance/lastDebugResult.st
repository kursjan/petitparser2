accessing
lastDebugResult
	^ (self currentDebugResult children) isEmpty ifTrue: [ 
		nil
	] ifFalse: [
		self currentDebugResult children last
	]