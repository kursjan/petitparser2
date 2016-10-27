initialization
initialize
	super initialize.
	
	beforeWater := PP2WaterNode new
		waterToken: self waterToken;
		yourself.
	afterWater := PP2WaterNode new
		waterToken: self waterToken;
		yourself.
