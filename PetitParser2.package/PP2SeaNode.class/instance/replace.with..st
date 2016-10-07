transforming
replace: node with: anotherNode
	island == node ifTrue: [ island := anotherNode ].
	beforeWater == node ifTrue: [ beforeWater := anotherNode ].
	afterWater == node ifTrue: [ afterWater := anotherNode ]		