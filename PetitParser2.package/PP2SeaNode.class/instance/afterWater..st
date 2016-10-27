accessing
afterWater: contexta
	"this is more or less lazy afterWater accessor"
	self halt: 'deprecated'.
	self assert: context isPetit2Context description: 'to set afterWater, use #setAfterWater:'.
	afterWater child ifNil: [ afterWater changeChild: (self createAfterWater: context) ].
	
	^ afterWater