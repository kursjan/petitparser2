tests
testTransformIdentityGrammarA
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