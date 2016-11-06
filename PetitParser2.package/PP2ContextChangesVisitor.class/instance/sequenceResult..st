visiting
sequenceResult: node
	| childrenResult pushes pops |
	childrenResult := node children collect: [ :child | self visit: child ].
	
	(childrenResult noneSatisfy: [:result | result isContextChange ]) ifTrue: [  
		^ PP2CcResult noChange
	].

	(childrenResult anySatisfy: [:result | result isUnknownChange ]) ifTrue: [  
		^ PP2CcResult change
	].

	pushes := (node children select: [ :child | (self visit: child) isContextPush ]).
	pops := (node children select: [ :child | (self visit: child) isContextPop ]).
	
	pushes size > 1 ifTrue: [ ^ PP2CcResult change ].
	pops size > 1 ifTrue: [ ^ PP2CcResult change ].
	
	((pushes size = 1) and: [ pops size = 0 ]) ifTrue: [  ^ PP2CcResult push	].
	((pops size = 1) and: [ pushes size = 0 ]) ifTrue: [ ^ PP2CcResult pop ].
	
	(pushes size = 1 and: [ pops size = 1 ]) ifTrue: [ 
		| pushIndex popIndex |
		pushIndex := node children indexOf: pushes first.
		popIndex := node children indexOf: pops first.
		
		pushIndex < popIndex ifTrue: [ ^ PP2CcResult noChange  ] ifFalse: [ ^ PP2CcResult change ]
	].

	self error: 'should happen?'.