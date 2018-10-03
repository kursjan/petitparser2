Class {
	#name : #PP2ReparseTest,
	#superclass : #PP2AbstractParserTest,
	#instVars : [
		'token1',
		'token2',
		'parser',
		'context'
	],
	#category : 'PetitParser2-Experiments-Reparsing'
}

{ #category : #asserting }
PP2ReparseTest >> assert: aPP2Parser reparseWithContext: startContext [
	| resultContext |
	resultContext := aPP2Parser optimize enableDebug reparseAdaptableWithContext: startContext.
	
	self assert: resultContext isPetit2Success.
	self assert: resultContext atEnd.
	
	^ resultContext
]

{ #category : #asserting }
PP2ReparseTest >> context [
	^ PP2ReparsableContext new
]

{ #category : #accessing }
PP2ReparseTest >> parse: aStream withParser: aParser withContext: aContext [
	^ aParser optimize enableDebug parseAdaptable: aStream withContext: aContext
]

{ #category : #tests }
PP2ReparseTest >> testReparseAndReparse [
	token1 := $a asPParser plus token reparsable.
	
	parser := token1, #space asPParser plus ==> #first.
	
	context := 'aa  ' asReparsableContext. 
	context := self assert: parser reparseWithContext: context.
	self assert: context returnValue value = 'aa'.
	self assert: context returnValue start = 1.
	self assert: context returnValue stop = 2.
	self assert: context debugResult steps equals: 9.
	
	context := 'aaa ' asReparsableContext.
	context := self assert: parser reparseWithContext: context.
	self assert: context returnValue value = 'aaa'.
	self assert: context returnValue start = 1.
	self assert: context returnValue stop = 3.
	self assert: context debugResult steps equals: 10.
]

{ #category : #tests }
PP2ReparseTest >> testReparseDeleteAfter [
	token1 := $a asPParser plus token reparsable.
	
	parser := token1, #space asPParser star ==> #first.
	
	context := self assert: parser parse: 'aa  '.
	self assert: context returnValue value = 'aa'.
	self assert: context returnValue start = 1.
	self assert: context returnValue stop = 2.
	self assert: context debugResult steps equals: 9.
	
	context applyChange: (PP2DeleteCharacter on: 'aa ' at: 4).
	context := self assert: parser reparseWithContext: context.
	self assert: context returnValue value = 'aa'.
	self assert: context returnValue start = 1.
	self assert: context returnValue stop = 2.
	self assert: context debugResult steps equals: 5.

]

{ #category : #tests }
PP2ReparseTest >> testReparseDeleteBefore [
	token1 := $a asPParser plus token reparsable.
	
	parser := #space asPParser star, token1 ==> #second.
	
	context := self assert: parser parse: ' aa'.
	self assert: context returnValue value = 'aa'.
	self assert: context returnValue start = 2.
	self assert: context returnValue stop = 3.
	self assert: context debugResult steps equals: 9.
	
	context applyChange: (PP2DeleteCharacter on: 'aa' at: 1).
	context := self assert: parser reparseWithContext: context.
	self assert: context returnValue value = 'aa'.
	self assert: context returnValue start = 1.
	self assert: context returnValue stop = 2.
	
	self assert: context debugResult steps equals: 5.
]

{ #category : #tests }
PP2ReparseTest >> testReparseDeleteHighBoundary [
	token1 := $a asPParser plus token reparsable.
	
	parser := token1, #space asPParser star ==> #first.
	context := self assert: parser parse: 'a  '.
	self assert: context returnValue value = 'a'.
	self assert: context debugResult steps equals: 8.
	
	context applyChange: (PP2DeleteCharacter on: 'a ' at: 2).
	context := self assert: parser reparseWithContext: context.
	self assert: context returnValue value = 'a'.
	self assert: context debugResult steps equals: 8.
]

{ #category : #tests }
PP2ReparseTest >> testReparseDeleteHighBoundaryError [
	token1 := $a asPParser plus token reparsable.
	
	parser := token1, #space asPParser star ==> #first.
	context := self assert: parser parse: 'a a' end: 2.
	self assert: context returnValue value = 'a'.
	self assert: context debugResult steps equals: 8.
	
	context applyChange: (PP2DeleteCharacter on: 'aa' at: 2).
	context := self assert: parser reparseWithContext: context.
	self assert: context returnValue value equals: 'aa'.
	self assert: context returnValue start equals: 1.
	self assert: context debugResult steps equals: 9.
]

{ #category : #tests }
PP2ReparseTest >> testReparseDeleteInRange [
	token1 := $a asPParser plus token reparsable.
	
	parser := #space asPParser star, token1, #space asPParser star ==> #second.
	context := self assert: parser parse: 'aaa'.
	self assert: context returnValue value = 'aaa'.
	self assert: context debugResult steps equals: 11.
	
	context applyChange: (PP2DeleteCharacter on: 'aa' at: 2).
	context := self assert: parser reparseWithContext: context.
	self assert: context returnValue value = 'aa'.
	self assert: context returnValue start = 1.
	self assert: context returnValue stop = 2.
	self assert: context debugResult steps equals: 10.
]

{ #category : #tests }
PP2ReparseTest >> testReparseDeleteLowBoundary [
	token1 := $a asPParser plus token reparsable.
	
	parser := #space asPParser star, token1 ==> #second.
	context := self assert: parser parse: ' a'.
	self assert: context returnValue value = 'a'.
	self assert: context debugResult steps equals: 8.
	
	context applyChange: (PP2InsertCharacter on: ' aa' at: 1).
	context := self assert: parser reparseWithContext: context.
	self assert: context returnValue value = 'aa'.
	self assert: context debugResult steps equals: 9.
]

{ #category : #tests }
PP2ReparseTest >> testReparseInsertAfter [
	token1 := $a asPParser plus token reparsable.
	
	parser := token1, #space asPParser star ==> #first.
	
	context := self assert: parser parse: 'a '.
	self assert: context returnValue value = 'a'.
	self assert: context returnValue start = 1.
	self assert: context returnValue stop = 1.
	self assert: context debugResult steps equals: 8.
	
	context applyChange: (PP2InsertCharacter on: 'a  ' at: 3).
	context := self assert: parser reparseWithContext: context.
	self assert: context returnValue value = 'a'.
	self assert: context returnValue start = 1.
	self assert: context returnValue stop = 1.
	self assert: context debugResult steps equals: 5.

]

{ #category : #tests }
PP2ReparseTest >> testReparseInsertBefore [
	token1 := $a asPParser plus token reparsable.
	
	parser := #space asPParser star, token1 ==> #second.
	
	context := self assert: parser parse: ' a'.
	self assert: context returnValue value = 'a'.
	self assert: context returnValue start = 2.
	self assert: context returnValue stop = 2.
	self assert: context debugResult steps equals: 8.
	
	context applyChange: (PP2InsertCharacter on: '  a' at: 1).
	context := self assert: parser reparseWithContext: context.
	self assert: context returnValue value = 'a'.
	self assert: context returnValue start = 3.
	self assert: context returnValue stop = 3.
	
	self assert: context debugResult steps equals: 5.
]

{ #category : #tests }
PP2ReparseTest >> testReparseInsertHighBoundary [
	token1 := $a asPParser plus token reparsable.
	
	parser := token1, #space asPParser star ==> #first.
	context := self assert: parser parse: 'a '.
	self assert: context returnValue value = 'a'.
	self assert: context debugResult steps equals: 8.
	
	context applyChange: (PP2InsertCharacter on: 'aa ' at: 2).
	context := self assert: parser reparseWithContext: context.
	self assert: context returnValue value = 'aa'.
	self assert: context debugResult steps equals: 9.
]

{ #category : #tests }
PP2ReparseTest >> testReparseInsertHighBoundaryError [
	token1 := $a asPParser plus token reparsable.
	
	parser := token1, #space asPParser star ==> #first.
	context := self assert: parser parse: 'aa a' end: 3.
	self assert: context returnValue value = 'aa'.
	self assert: context debugResult steps equals: 9.
	
	context applyChange: (PP2InsertCharacter on: 'a  ' at: 2).
	context := self assert: parser reparseWithContext: context.
	self assert: context returnValue value = 'a'.
	self assert: context debugResult steps equals: 8.
]

{ #category : #tests }
PP2ReparseTest >> testReparseInsertInRange [
	token1 := $a asPParser plus token reparsable.
	
	parser := #space asPParser star, token1, #space asPParser star ==> #second.
	context := self assert: parser parse: 'aa'.
	self assert: context returnValue value = 'aa'.
	self assert: context debugResult steps equals: 10.
	
	context applyChange: (PP2InsertCharacter on: 'aaa' at: 2).
	context := self assert: parser reparseWithContext: context.
	self assert: context returnValue value = 'aaa'.
	self assert: context returnValue start = 1.
	self assert: context returnValue stop = 3.
	self assert: context debugResult steps equals: 11.
]

{ #category : #tests }
PP2ReparseTest >> testReparseInsertLowBoundary [
	token1 := $a asPParser plus token reparsable.
	
	parser := #space asPParser star, token1 ==> #second.
	context := self assert: parser parse: ' a'.
	self assert: context returnValue value = 'a'.
	self assert: context debugResult steps equals: 8.
	
	context applyChange: (PP2InsertCharacter on: ' aa' at: 1).
	context := self assert: parser reparseWithContext: context.
	self assert: context returnValue value = 'aa'.
	self assert: context debugResult steps equals: 9.
]

{ #category : #tests }
PP2ReparseTest >> testReparseInsertLowBoundaryError [
	token1 := $a asPParser plus token reparsable.
	
	parser := #space asPParser star, token1 ==> #second.
	context := self assert: parser parse: ' a'.
	self assert: context returnValue value = 'a'.
	self assert: context debugResult steps equals: 8.
	
	context applyChange: (PP2InsertCharacter on: '  a' at: 2).
	context := self assert: parser reparseWithContext: context.
	self assert: context returnValue value = 'a'.
	self assert: context debugResult steps equals: 8.
]

{ #category : #tests }
PP2ReparseTest >> testReparseMultipleChanges [
	token1 := $a asPParser plus token reparsable.
	
	parser := #space asPParser plus, token1 ==> #second.
	
	context := '  aa' asReparsableContext. 
	context := self assert: parser reparseWithContext: context.
	self assert: context returnValue value = 'aa'.
	self assert: context returnValue start = 3.
	self assert: context returnValue stop = 4.
	self assert: context debugResult steps equals: 9.
	
	context applyChange: (PP2InsertCharacter on: '   aa' at: 1).
	context applyChange: (PP2InsertCharacter on: '    aa' at: 2).
	context := self assert: parser reparseWithContext: context.
	self assert: context returnValue value = 'aa'.
	self assert: context returnValue start = 5.
	self assert: context returnValue stop = 6.
	
	self assert: context debugResult steps equals: 5.	
]

{ #category : #tests }
PP2ReparseTest >> testReparseMultipleChangesAtEnd [
	token1 := $a asPParser plus token reparsable.
	
	parser := #space asPParser plus, token1 ==> #second.
	
	context := '  aa' asReparsableContext. 
	context := self assert: parser reparseWithContext: context.
	self assert: context returnValue value = 'aa'.
	self assert: context returnValue start = 3.
	self assert: context returnValue stop = 4.
	self assert: context debugResult steps equals: 9.
	
	context applyChange: (PP2InsertCharacter on: '  aaa' at: 4).
	context applyChange: (PP2InsertCharacter on: '  aaaa' at: 5).
	context := self assert: parser reparseWithContext: context.
	self assert: context returnValue value = 'aaaa'.
	self assert: context returnValue start = 3.
	self assert: context returnValue stop = 6.
	
	self assert: context debugResult steps equals: 11.	
]

{ #category : #tests }
PP2ReparseTest >> testReparseNested [
	token1 := $a asPParser plus token reparsable.
	
	parser := (#space asPParser plus, token1) reparsable ==> #second.
	
	context := self assert: parser parse: '  aa'.
	self assert: context returnValue value = 'aa'.
	self assert: context returnValue start = 3.
	self assert: context returnValue stop = 4.
	self assert: context debugResult steps equals: 9.
	
	context applyChange: (PP2InsertCharacter on: '   aa' at: 1).
	context := self assert: parser reparseWithContext: context.
	self assert: context debugResult steps equals: 5.
	
	context applyChange: (PP2InsertCharacter on: '    aa' at: 2).
	context := self assert: parser reparseWithContext: context.
	self assert: context debugResult steps equals: 5.
]
