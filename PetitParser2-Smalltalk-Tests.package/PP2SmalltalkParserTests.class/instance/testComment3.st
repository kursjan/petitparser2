testing
testComment3
	super testComment3.
	self assert: result isMessage.
	self assert: result receiver isValue.
	self assert: result selector equals: #+.
	self assert: result arguments first isValue