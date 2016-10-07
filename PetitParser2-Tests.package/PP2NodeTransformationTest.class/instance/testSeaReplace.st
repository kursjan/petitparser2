tests
testSeaReplace
	| island sea beforeWater afterWater otherIsland otherBeforeWater otherAfterWater |

	island := $a asPParser.
	sea := island sea.
	beforeWater := sea beforeWater.
	afterWater := sea afterWater.
	
	otherIsland := $b asPParser.
	otherBeforeWater := $c asPParser.
	otherAfterWater := $d asPParser.	
	
	self assert: sea children first == beforeWater.
	self assert: sea children second == island.
	self assert: sea children third == afterWater.
	
	sea replace: island with: otherIsland.
	self assert: sea children second == otherIsland.
	self assert: sea children first == beforeWater.
	self assert: sea children third == afterWater.
	
	sea replace: beforeWater  with: otherBeforeWater.
	self assert: sea children first == otherBeforeWater.
	
	sea replace: afterWater  with: otherAfterWater.
	self assert: sea children third == otherAfterWater.