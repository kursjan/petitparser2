tests
testWater
	self denyIsNullable: (PP2WaterNode new boundary: nil asPParser).
	self denyIsNullable: (PP2WaterNode new boundary: $a asPParser).