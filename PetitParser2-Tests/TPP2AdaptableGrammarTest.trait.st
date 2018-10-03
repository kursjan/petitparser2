"
TestSuite for PP2AdaptableGrammar
"
Trait {
	#name : #TPP2AdaptableGrammarTest,
	#category : 'PetitParser2-Tests-Examples'
}

{ #category : #accessing }
TPP2AdaptableGrammarTest >> parserClass [
	^ PP2AdaptableGrammar
]

{ #category : #tests }
TPP2AdaptableGrammarTest >> testContent [
	self parse: '1_2__3___' rule: #content.
	self fail: '1_2' rule: #content.
]

{ #category : #tests }
TPP2AdaptableGrammarTest >> testElement [
	self parse: '1a' rule: #element.
	self parse: '2aa' rule: #element.
	self fail: '2a' rule: #element.
]

{ #category : #tests }
TPP2AdaptableGrammarTest >> testElementNumberInBody [
	self parse: '10___4______' rule: #content.
	self fail: '1_2' rule: #content.
]

{ #category : #tests }
TPP2AdaptableGrammarTest >> testHead [
	self parse: '1' rule: #head
]
