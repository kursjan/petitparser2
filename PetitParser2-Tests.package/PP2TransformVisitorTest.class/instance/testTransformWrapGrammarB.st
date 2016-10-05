tests
testTransformWrapGrammarB
	| orig tran |
	orig := self grammarB.
	tran := orig transform: [ :each | each wrapped ].
	
	self assert: orig class == PP2DelegateNode.
	self assert: orig child == orig.
	
	self assert: tran class == PP2DelegateNode.
	self assert: tran child class == PP2DelegateNode.
	self assert: tran child child == tran