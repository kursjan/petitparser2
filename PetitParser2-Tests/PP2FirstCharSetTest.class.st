Class {
	#name : #PP2FirstCharSetTest,
	#superclass : #TestCase,
	#instVars : [
		'firstCharSet'
	],
	#category : 'PetitParser2-Tests-Analysis'
}

{ #category : #support }
PP2FirstCharSetTest >> assert: aPP2CharSetPredicate value: anInteger [
	self assert: (aPP2CharSetPredicate value: anInteger) 
]

{ #category : #support }
PP2FirstCharSetTest >> reject: aPP2CharSetPredicate value: anInteger [
	self assert: (aPP2CharSetPredicate value: anInteger) not
]

{ #category : #tests }
PP2FirstCharSetTest >> testEmptyLiteralSequence [
	firstCharSet := '' asPParser firstCharSet.

	1 to: 255 do: [ :index |
		self assert: firstCharSet value: (Character codePoint: index).
	].

	self assert: firstCharSet value: (Character codePoint: 0).
	self assert: firstCharSet value: (Character codePoint: 1234).


]

{ #category : #tests }
PP2FirstCharSetTest >> testEpsilon [
	firstCharSet := nil asPParser firstCharSet.

	1 to: 255 do: [ :index |
		self assert: firstCharSet value: (Character codePoint: index).
	].

	self assert: firstCharSet value: (Character codePoint: 0).
	self assert: firstCharSet value: (Character codePoint: 1234).


]

{ #category : #tests }
PP2FirstCharSetTest >> testLiteralObject [
	firstCharSet := $b asPParser firstCharSet.
	self assert: firstCharSet value: $b.

	self reject: firstCharSet value: $a.
	self reject: firstCharSet value: $c.
	
	self reject: firstCharSet value: (Character codePoint: 1024).
	

]

{ #category : #tests }
PP2FirstCharSetTest >> testLiteralSequence [
	firstCharSet := 'foobar' asPParser firstCharSet.
	self assert: firstCharSet value: $f.

	self reject: firstCharSet value: $e.
	self reject: firstCharSet value: $o.
	self reject: firstCharSet value: $b.
	
	self reject: firstCharSet value: 1024.
	

]

{ #category : #tests }
PP2FirstCharSetTest >> testNot [
	firstCharSet := #digit asPParser not firstCharSet.
	self should: [ firstCharSet value: $1 ] raise: Error

]

{ #category : #tests }
PP2FirstCharSetTest >> testPluggable [
	firstCharSet := ([ :c | c next ] asPParser) firstCharSet.
	self assert: firstCharSet isUnknown.

]

{ #category : #tests }
PP2FirstCharSetTest >> testPredicateObject [
	firstCharSet := #digit asPParser firstCharSet.

	self assert: firstCharSet value: $0.
	self assert: firstCharSet value: $1.
	self assert: firstCharSet value: $2.
	self assert: firstCharSet value: $3.
	self assert: firstCharSet value: $4.
	self assert: firstCharSet value: $5.
	self assert: firstCharSet value: $6.
	self assert: firstCharSet value: $7.
	self assert: firstCharSet value: $8.
	self assert: firstCharSet value: $9.

	self reject: firstCharSet value: $/.
	self reject: firstCharSet value: $:.
	
	self reject: firstCharSet value: (Character codePoint: 1024).
	self reject: firstCharSet value: (Character codePoint: 0).
	

]

{ #category : #tests }
PP2FirstCharSetTest >> testStartOfLine [
	firstCharSet := #startOfLine asPParser firstCharSet.

	self should: [ firstCharSet value: $1 ] raise: Error

]

{ #category : #tests }
PP2FirstCharSetTest >> testWrapping [
	firstCharSet := ($a asPParser >=> [ :c :cc | cc value ]) firstCharSet.

	self assert: firstCharSet isUnknown.

]

{ #category : #tests }
PP2FirstCharSetTest >> testWrappingNonFunctional [
	firstCharSet := ($b asPParser >==> [ :c :cc | cc value ]) firstCharSet.

	self assert: firstCharSet value: $b.

	self reject: firstCharSet value: $a.
	self reject: firstCharSet value: $c.

]
