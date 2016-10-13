reparsing
adoptString: newString
	collection := newString.
	readLimit := newString size.
	self assert: readLimit isNotNil.