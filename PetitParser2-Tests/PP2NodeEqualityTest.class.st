Class {
	#name : #PP2NodeEqualityTest,
	#superclass : #TestCase,
	#instVars : [
		'parserOne',
		'parserTwo'
	],
	#category : 'PetitParser2-Tests-Nodes'
}

{ #category : #support }
PP2NodeEqualityTest >> deny: anObject equals: anotherObject [
	self assert: (anObject = anotherObject) not
]

{ #category : #tests }
PP2NodeEqualityTest >> testCycle [
	parserOne := PP2DelegateNode new.
	parserTwo := PP2DelegateNode new.
	
	parserOne child: parserTwo.
	parserTwo child: parserOne.
	
	self deny:  parserOne == parserTwo.
	self assert: parserOne equals: parserTwo.
	
	self assert: parserOne hash equals: parserTwo hash.
]

{ #category : #tests }
PP2NodeEqualityTest >> testPossesiveRepeating [
	parserOne := #space asPParser star.
	parserTwo := #space asPParser star.
	
	self deny:  	 parserOne == parserTwo.
	self assert: parserOne equals: parserTwo.
	
	self assert: parserOne hash equals: parserTwo hash.
]

{ #category : #tests }
PP2NodeEqualityTest >> testPossesiveRepeatingDifferent [
	parserOne := #space asPParser star.
	parserTwo := #space asPParser plus.
	
	self deny: parserOne == parserTwo.
	self deny: parserOne equals: parserTwo.
	
	self deny: parserOne hash equals: parserTwo hash.
]

{ #category : #tests }
PP2NodeEqualityTest >> testPossesiveRepeatingDifferent2 [
	parserOne := #space asPParser star.
	parserTwo := #blank asPParser star.
	
	self deny: parserOne == parserTwo.
	self deny: parserOne equals: parserTwo.
	
	self deny: parserOne hash equals: parserTwo hash.
]

{ #category : #tests }
PP2NodeEqualityTest >> testPredicateObject [
	parserOne := #space asPParser.
	parserTwo := #space asPParser.
	
	self deny:   parserOne == parserTwo.
	self assert: parserOne equals: parserTwo.
	
	self assert: parserOne hash equals: parserTwo hash.
]

{ #category : #tests }
PP2NodeEqualityTest >> testSequence [
	parserOne := $a asPParser, #word asPParser.
	parserTwo := $a asPParser, #word asPParser.
	
	self deny:   parserOne == parserTwo.
	self assert: parserOne equals: parserTwo.
	
	self assert: parserOne hash equals: parserTwo hash.
]
