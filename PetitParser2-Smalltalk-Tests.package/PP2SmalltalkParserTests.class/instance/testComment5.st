testing
testComment5
	super testComment5.
	self assert: result isMessage.
	self assert: result receiver isValue.
	self assert: result selector equals: #+.
	self assert: result arguments first isValue