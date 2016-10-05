tests
testTransformWrapGrammarA
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