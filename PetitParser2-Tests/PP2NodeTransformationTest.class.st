Class {
	#name : #PP2NodeTransformationTest,
	#superclass : #TestCase,
	#category : 'PetitParser2-Tests-Nodes'
}

{ #category : #tests }
PP2NodeTransformationTest >> testDelegateReplace [
	| one other delegate |
	one := $a asPParser.
	other := $b asPParser.
	
	delegate := one token.
	self assert: delegate children first == one.
	self deny: delegate children first == other.
	
	delegate replace: other with: one.
	self assert: delegate children first == one.
	self deny: delegate children first == other.
	
	delegate replace: one with: other.
	self deny: delegate children first == one.
	self assert: delegate children first == other
]

{ #category : #tests }
PP2NodeTransformationTest >> testListReplace [
	| one other another list |
	one := $a asPParser.
	other := $b asPParser.
	another := $c asPParser.
	list := one , another , one.
	self assert: list children first == one.
	self assert: list children second == another.
	self assert: list children last == one.
	
	list replace: other with: one.
	self assert: list children first == one.
	self assert: list children second == another.
	self assert: list children last == one.
	
	list replace: one with: other.
	self assert: list children first == other.
	self assert: list children second == another.
	self assert: list children last == other.
	
	list replace: another with: one.
	self assert: list children first == other.
	self assert: list children second == one.
	self assert: list children last == other
]

{ #category : #tests }
PP2NodeTransformationTest >> testSeaReplace [
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
]

{ #category : #tests }
PP2NodeTransformationTest >> testTrimmingReplace [
	| one trimmer trimming other otherTrimmer |

	one := $a asPParser.
	trimmer := $b asPParser.
	
	other := $c asPParser.
	otherTrimmer := $d asPParser.
	
	trimming := one trim: trimmer.

	self assert: trimming children first == trimmer.
	self assert: trimming children second == one.
	self deny: trimming children first == otherTrimmer.
	self deny: trimming children second == other.
	
	trimming replace: trimmer with: otherTrimmer.
	self assert: trimming children first == otherTrimmer.
	self assert: trimming children second == one.
	
	trimming replace: one with: other.
	self assert: trimming children second == other
]
