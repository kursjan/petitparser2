Class {
	#name : #PP2MSEArrayParserTest,
	#superclass : #PP2MSEGrammarTest,
	#category : 'PetitParser2-MSE'
}

{ #category : #accessing }
PP2MSEArrayParserTest >> parserClass [
	^ PP2MSEArrayParser
]

{ #category : #tests }
PP2MSEArrayParserTest >> testElementName [
	super testElementName.
	self assert: result equals: 'ABC.XYZ'
]

{ #category : #'tests-start' }
PP2MSEArrayParserTest >> testEmpty [
	self assert: '()' is: #().
	self assert: '( )' is: #().
	self assert: ' ( ) ' is: #().
]

{ #category : #'tests-basic' }
PP2MSEArrayParserTest >> testNatural [
	super testNatural.
	self assert: result equals: 123
]

{ #category : #'tests-basic' }
PP2MSEArrayParserTest >> testNaturalWithSpace [
	super testNaturalWithSpace.
	self assert: result equals: 123
]

{ #category : #'tests-basic' }
PP2MSEArrayParserTest >> testNumberWithE [
	super testNumberWithE.
	self assert: result equals: -1.2345
]

{ #category : #'tests-start' }
PP2MSEArrayParserTest >> testOneElement [
	self assert: '((X))' is: #(('X' nil #())).
	self assert: '((X.Y))' is: #(('X.Y' nil #())).
	
]

{ #category : #'tests-start' }
PP2MSEArrayParserTest >> testOneElementWithBooleanAttribute [
	self assert: '((X.Y (attribute true)))' is: #(('X.Y' nil #(('attribute' true))))
]

{ #category : #'tests-start' }
PP2MSEArrayParserTest >> testOneElementWithId [
	self assert: '((FAMIX.Class (id: 1)))' is: #(('FAMIX.Class' #('id' 1) #())).
	self assert: '( ( FAMIX.Class (id: 1) ) )' is: #(('FAMIX.Class' #('id' 1) #())).
	self assert: '( 
	( FAMIX.Class (id: 1) )
)' is: #(('FAMIX.Class' #('id' 1) #())).
	self assert: '( 
(FAMIX.Class (id: 1)
)
)' is: #(('FAMIX.Class' #('id' 1) #()))
]

{ #category : #'tests-start' }
PP2MSEArrayParserTest >> testOneElementWithMultipleSubElements [
	self assert: '((X (sub (Y) (Z))))' is: #(#('X' nil #(#('sub' #(#('Y' nil #()) #('Z' nil #())))))).
	
]

{ #category : #'tests-start' }
PP2MSEArrayParserTest >> testOneElementWithNumericAttribute [
	self assert: '((X.Y (attribute 2)))' is: #(('X.Y' nil #(('attribute' 2)))).
	self assert: '((X.Y (attribute 2.1)))' is: #(('X.Y' nil #(('attribute' 2.1)))).
	self assert: '((X.Y (attribute 1234.567)))' is: #(('X.Y' nil #(('attribute' 1234.567))))
]

{ #category : #'tests-start' }
PP2MSEArrayParserTest >> testOneElementWithStringAttribute [
	self assert: '((FAMIX.Class (name ''Something'')))' is: #(('FAMIX.Class' nil #(('name' 'Something')))).
	self assert: '((FAMIX.Class (attribute ''as:.,><asd'')))' is: #(('FAMIX.Class' nil #(('attribute' 'as:.,><asd')))).
]

{ #category : #'tests-start' }
PP2MSEArrayParserTest >> testOneElementWithSubElement [
	self assert: '((X (sub (Y))))' is: #(#('X' nil #(#('sub' #('Y' nil #())))))
]

{ #category : #'tests-basic' }
PP2MSEArrayParserTest >> testString [
	super testString.
	self assert: result equals: 'abc'
]

{ #category : #'tests-start' }
PP2MSEArrayParserTest >> testStringEscape [
	super testStringEscape.
	self assert: result equals: 'It''s here'
]

{ #category : #'tests-basic' }
PP2MSEArrayParserTest >> testStringTextWithEscapeChars [
	super testStringTextWithEscapeChars.
	self assert: result equals: 'a''bc'
]
