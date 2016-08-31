as yet unclassified
instance
	instance isNil ifTrue: [ 
		instance := PP2FailingNode message: 'failing'
	].
	^ instance