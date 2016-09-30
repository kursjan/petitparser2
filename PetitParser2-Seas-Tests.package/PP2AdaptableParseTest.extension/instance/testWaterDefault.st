*PetitParser2-Seas-Tests
testWaterDefault
	| water |
	water := PP2WaterNode new.
	
	self assert: water parse: 'foobar' to: 'foobar'.
	self assert: water parse: '' to: ''