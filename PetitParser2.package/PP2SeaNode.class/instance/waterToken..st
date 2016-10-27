accessing
waterToken: waterToken
	self propertyAt: #waterToken put: waterToken.
	
	beforeWater waterToken: waterToken.
	afterWater waterToken: waterToken.