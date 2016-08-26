testing
testComment2
	super testComment2.
	self assert: result isMessage.
	self assert: result receiver isValue.
	self assert: result selector equals: #+.
	self assert: result arguments first isValue