testing-invalid
testInvalidNumberInteger
	self assertInvalid: '00'.
	self assertInvalid: '01'.
	self assertInvalid: '00.1'