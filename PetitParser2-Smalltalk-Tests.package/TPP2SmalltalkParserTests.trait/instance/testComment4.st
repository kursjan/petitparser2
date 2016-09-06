testing
testComment4
	super testComment4.
	self assert: self result isMessage.
	self assert: self result receiver isValue.
	self assert: self result selector equals: #+.
	self assert: self result arguments first isValue