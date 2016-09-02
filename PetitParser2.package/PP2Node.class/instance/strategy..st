accessing
strategy: aPP2Strategy
	(strategy == aPP2Strategy) ifTrue: [ ^ self ].
	self assert: aPP2Strategy node == self.
	strategy := aPP2Strategy