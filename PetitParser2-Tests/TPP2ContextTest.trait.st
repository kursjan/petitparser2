Trait {
	#name : #TPP2ContextTest,
	#category : 'PetitParser2-Tests-Core'
}

{ #category : #requirements }
TPP2ContextTest >> contextOn: aString [
	self explicitRequirement
]

{ #category : #tests }
TPP2ContextTest >> testAdoptString [
	| context |
	context := self contextOn: 'foo'.
	
	self assert: context contents equals: 'foo'.
	
	context adoptString: 'bar'.
	self assert: context contents equals: 'bar'.
]

{ #category : #tests }
TPP2ContextTest >> testAtEnd [
	| context |
	context := self contextOn: 'foo'.
	
	self deny: context atEnd.
	context next: 3.
	self assert: context atEnd.

]

{ #category : #tests }
TPP2ContextTest >> testContents [
	| context |
	context := self contextOn: 'foo'.
	
	self assert: (context respondsTo: #contents).
	self assert: context contents equals: 'foo'
]

{ #category : #tests }
TPP2ContextTest >> testCopyGlobals [
	| context contextCopy |
	context := self contextOn: 'foo'.
	context globals: (IdentityDictionary newFromPairs: { #a . #b }).
	
	contextCopy := context copy.
	
	self assert: context globals equals: contextCopy globals.
	self assert: context globals ~~ contextCopy globals.
	
]

{ #category : #tests }
TPP2ContextTest >> testMemo [
	| context memento |
	context := self contextOn: 'foobar'.
	context propertyAt: #foo put: #bar.
	memento := context remember.

	context next.
	context propertyAt: #bar put: #baz.
	context propertyAt: #foo put: #bark.

	context restore: memento.
	self assert: context position equals: 0.
	self deny: (context hasProperty: #bar).
	self assert: (context propertyAt: #foo) equals: #bar.
]

{ #category : #tests }
TPP2ContextTest >> testNext [
	| retval context |
	context := self contextOn: 'foo'.
	
	retval := context next: 3.
	self assert: retval isPetit2Success.
	self assert: retval equals: 'foo'.
	
	retval := context next: 1.
	self assert: retval isNil.
	
	context position: 0.
	retval := context next: 3.
	self assert: retval isPetit2Success.
	self assert: retval = 'foo'.

]

{ #category : #tests }
TPP2ContextTest >> testNextAtEnd [
	| context retval |
	context := self contextOn: 'foo'.
	
	context position: 3.
	
	retval := context next.
	self assert: retval isNil.	
	self assert: context position equals: 3.
]

{ #category : #tests }
TPP2ContextTest >> testParser [
	| context parser |
	parser := $a asPParser.
	
	context := (self contextOn: 'bar')
		parser: parser;
		yourself.
	
	self assert: context parser equals: parser.
]

{ #category : #tests }
TPP2ContextTest >> testPeek [
	| context |
	context := self contextOn: 'foo'.
	self assert: context peek equals: $f.
	
	context upToEnd.
	self assert: context peek equals: nil.
]

{ #category : #tests }
TPP2ContextTest >> testPeekBack [
	| context |
	context := self contextOn: 'bar'.
	self should: [ context peekBack ] raise: Exception.
	
	context upToEnd.	
	self assert: context peekBack equals: $r.
]

{ #category : #tests }
TPP2ContextTest >> testRemember [
	| context memento |
	context := self contextOn: 'foobar'.
	context propertyAt: #foo put: #bar.
	memento := context remember.

	self assert: memento position equals: context position.
	self assert: memento properties equals: context properties.

	context propertyAt: #foo put: #baz.
	self assert: (memento propertyAt: #foo) equals: #bar.
]

{ #category : #tests }
TPP2ContextTest >> testRestore [
	| context memento |
	context := self contextOn: 'foobar'.
	context propertyAt: #foo put: #bar.
	memento := context remember.

	context next.
	context propertyAt: #foo put: #baz.
	context propertyAt: #bar put: #baq.

	context restore: memento.
	self deny: (context hasProperty: #bar).
	self assert: (context propertyAt: #foo) equals: #bar.
	self assert: context position equals: 0.
]

{ #category : #tests }
TPP2ContextTest >> testSuccess [
	| context |
	context := (self contextOn: 'bar')
		position: 1;
		returnValue: #foo;
		yourself.
	
	self assert: context isPetit2Success.
	self assert: context value == #foo.
	self assert: context returnValue == #foo.
	self assert: context atEnd not.
	self assert: context uncheckedPeek == $a.
]

{ #category : #tests }
TPP2ContextTest >> testUncheckedNext [
	| context retval |
	context := self contextOn: 'foo'.
	
	self assert: context position equals: 0.
	
	retval := context uncheckedNext.
	self assert: retval isPetit2Success.
	self assert: retval equals: $f.
	self assert: context position equals: 1.
]

{ #category : #tests }
TPP2ContextTest >> testUncheckedPeek [
	| context |
	context := self contextOn: 'foo'.
		
	self assert: context uncheckedPeek == $f.
	
	context position: 3.
	self should: [context uncheckedPeek] raise: Error.
	
]

{ #category : #tests }
TPP2ContextTest >> testUpTo [
	| context retval |
	context := self contextOn: 'foobar'.

	self assert: context position equals: 0.
		
	retval := context upTo: $f.

	self assert: context position equals: 1.
	self assert: retval equals: 'f'.
	
]

{ #category : #tests }
TPP2ContextTest >> testUpTo2 [
	| context retval |
	context := self contextOn: 'foobar'.

	self assert: context position equals: 0.
		
	retval := context upTo: $r.

	self assert: context position equals: 6.
	self assert: retval equals: 'foobar'.
]

{ #category : #tests }
TPP2ContextTest >> testUpTo3 [
	| context retval |
	context := self contextOn: 'foobar'.

	self assert: context position equals: 0.
		
	retval := context upTo: $x.

	self assert: context position equals: 6.
	self assert: retval equals: 'foobar'.
]

{ #category : #tests }
TPP2ContextTest >> testUpTo4 [
	| context retval |
	context := self contextOn: 'foof'.

	context next.
	self assert: context position equals: 1.
		
	retval := context upTo: $f.

	self assert: context position equals: 4.
	self assert: retval equals: 'oof'.
	
]

{ #category : #tests }
TPP2ContextTest >> testUpToEnd [
	| context retval |
	context := self contextOn: 'foobar'.

	self assert: context position equals: 0.
		
	retval := context upToEnd.

	self assert: context position equals: 6.
	self assert: retval equals: 'foobar'.
	
]
