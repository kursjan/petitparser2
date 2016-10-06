accessing
afterWater: context
	"this is more or less lazy afterWater accessor"

	self assert: context isPetit2Context description: 'to set afterWater, use #setAfterWater:'.
	afterWater child ifNil: [ afterWater changeChild: (self createAfterWater: context) ].
	
	^ afterWater