visiting
sequenceResult: node
	| pushes pops |
	(node children noneSatisfy: [:child | (self visit: child) isContextChange ]) ifTrue: [  
		^ PP2CaResult noChange
	].

	(node children anySatisfy: [:child | (self visit: child) isUnknownChange ]) ifTrue: [  
		^ PP2CaResult change
	].

	pushes := (node children select: [ :child | (self visit: child) isPush ]).
	pops := (node children select: [ :child | (self visit: child) isPop ]).
	
	pushes size > 1 ifTrue: [ ^ PP2CaResult change ].
	pops size > 1 ifTrue: [ ^ PP2CaResult change ].
	
	((pushes size = 1) and: [ pops size = 0 ]) ifTrue: [  ^ PP2CaResult push	].
	((pops size = 1) and: [ pushes size = 0 ]) ifTrue: [ ^ PP2CaResult pop ].
	
	(pushes size = 1 and: [ pops size = 1 ]) ifTrue: [ 
		| pushIndex popIndex |
		pushIndex := node children indexOf: pushes first.
		popIndex := node children indexOf: pops first.
		
		pushIndex < popIndex ifTrue: [ ^ PP2CaResult noChange  ] ifFalse: [ ^ PP2CaResult change ]
	].

	self error: 'should happen?'.