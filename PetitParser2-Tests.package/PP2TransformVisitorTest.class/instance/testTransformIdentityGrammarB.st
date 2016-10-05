tests
testTransformIdentityGrammarB
	| orig tran |
	orig := self grammarB.
	tran := orig transform: [ :each | each ].
	self deny: orig == tran.
	self deny: orig children first == tran children first.
	
	self assert: orig class == PP2DelegateNode.
	self assert: orig children first == orig.
	
	self assert: tran class == PP2DelegateNode.
	self assert: tran children first == tran