Class {
	#name : #PP2TransformVisitorTest,
	#superclass : #TestCase,
	#category : 'PetitParser2-Tests-Core'
}

{ #category : #grammars }
PP2TransformVisitorTest >> grammarA [
	"A highly recrusive grammar."

	| grammar |
	grammar := PP2UnresolvedNode new.
	grammar def: (grammar , $+ asPParser , grammar) / $1 asPParser.
	^grammar
]

{ #category : #grammars }
PP2TransformVisitorTest >> grammarB [
	"The most stupid parser, it just references itself and never consumes anything. All algorithms should survive such an attack."

	| parser |
	parser := PP2DelegateNode new.
	parser child: parser.
	^ parser
]

{ #category : #tests }
PP2TransformVisitorTest >> testTransformIdentityGrammarA [
	| orig tran |
	orig := self grammarA.
	tran := orig transform: [ :each | each ].
	self deny: orig == tran.
	self deny: orig children first == tran children first.
	self deny: orig children first children first == tran children first children first.
	self deny: orig children first children last == tran children first children last.
	self deny: orig children last == tran children last.
	
	self assert: orig class == PP2ChoiceNode.
	self assert: orig children first class == PP2SequenceNode.
	self assert: orig children first children first == orig.
	self assert: orig children first children last == orig.
	self assert: orig children last class == PP2LiteralObjectNode.

	self assert: tran class == PP2ChoiceNode.
	self assert: tran children first class == PP2SequenceNode.
	self assert: tran children first children first == tran.
	self assert: tran children first children last == tran.
	self assert: tran children last class == PP2LiteralObjectNode
]

{ #category : #tests }
PP2TransformVisitorTest >> testTransformIdentityGrammarB [
	| orig tran |
	orig := self grammarB.
	tran := orig transform: [ :each | each ].
	self deny: orig == tran.
	self deny: orig children first == tran children first.
	
	self assert: orig class == PP2DelegateNode.
	self assert: orig children first == orig.
	
	self assert: tran class == PP2DelegateNode.
	self assert: tran children first == tran
]

{ #category : #tests }
PP2TransformVisitorTest >> testTransformWrapGrammarA [
	| orig tran |
	orig := self grammarA.
	tran := orig transform: [ :each | each wrapped ].

	self assert: orig class == PP2ChoiceNode.
	self assert: orig children first class == PP2SequenceNode.
	self assert: orig children first children first == orig.
	self assert: orig children first children last == orig.
	self assert: orig children last class == PP2LiteralObjectNode.
	
	self assert: tran class == PP2DelegateNode.
	self assert: tran children first class == PP2ChoiceNode.
	self assert: tran children first children first class == PP2DelegateNode.
	self assert: tran children first children first children first class == PP2SequenceNode.
	self assert: tran children first children first children first children first == tran.
	self assert: tran children first children first children first children last == tran.
	self assert: tran children first children last class == PP2DelegateNode.
	self assert: tran children first children last children first class == PP2LiteralObjectNode
]

{ #category : #tests }
PP2TransformVisitorTest >> testTransformWrapGrammarB [
	| orig tran |
	orig := self grammarB.
	tran := orig transform: [ :each | each wrapped ].
	
	self assert: orig class == PP2DelegateNode.
	self assert: orig child == orig.
	
	self assert: tran class == PP2DelegateNode.
	self assert: tran child class == PP2DelegateNode.
	self assert: tran child child == tran
]
