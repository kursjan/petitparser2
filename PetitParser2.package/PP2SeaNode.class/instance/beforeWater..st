accessing
beforeWater: contexta
	"this is more or less lazy beforeWater accessor"
	self halt: 'deprecated'.
	self 	assert: context isPetit2Context description: 'to set beforeWater, use #setAfterWater:'.
	beforeWater child ifNil: [ beforeWater changeChild: (self createBeforeWater: context) ].
	
	^ beforeWater