accessing
afterWater: context
	self assert: context isPetit2Context description: 'to set afterWater, use #setAfterWater:'.
	afterWater child ifNil: [ afterWater changeChild: (self createAfterWater: context) ].
	^ afterWater