Class {
	#name : #PP2MSEGrammarTest,
	#superclass : #PP2CompositeNodeTest,
	#category : 'PetitParser2-MSE'
}

{ #category : #accessing }
PP2MSEGrammarTest >> parserClass [
	^ PP2MSEGrammar
]

{ #category : #'tests-basic' }
PP2MSEGrammarTest >> testClose [
	self parse: ')' rule: #close.
	self parse: ' )' rule: #close.
	self parse: ') ' rule: #close.
	self parse: ' 	) 
		' rule: #close
]

{ #category : #tests }
PP2MSEGrammarTest >> testElementName [ 
	self parse: 'ABC.XYZ' rule: #elementName
]

{ #category : #'tests-basic' }
PP2MSEGrammarTest >> testNatural [
	self parse: '123' rule: #natural
]

{ #category : #'tests-basic' }
PP2MSEGrammarTest >> testNaturalWithSpace [
	self parse: '	123
		 ' rule: #natural
]

{ #category : #'tests-basic' }
PP2MSEGrammarTest >> testNumberWithE [
	self parse: '	-123.45E-2' rule: #number
]

{ #category : #'tests-basic' }
PP2MSEGrammarTest >> testOpen [
	self parse: '(' rule: #open.
	self parse: ' (' rule: #open.
	self parse: '( ' rule: #open.
	self parse: ' 	( 
		' rule: #open
]

{ #category : #'tests-basic' }
PP2MSEGrammarTest >> testString [
	self parse: '''abc''' rule: #string
]

{ #category : #tests }
PP2MSEGrammarTest >> testStringEscape [
	self parse: '''It''''s here''' rule: #string
]

{ #category : #'tests-basic' }
PP2MSEGrammarTest >> testStringText [
	self parse: '1.,abc' rule: #stringText
]

{ #category : #'tests-basic' }
PP2MSEGrammarTest >> testStringTextWithEscapeChars [
	self parse: 'a''''bc' rule: #stringText
]
