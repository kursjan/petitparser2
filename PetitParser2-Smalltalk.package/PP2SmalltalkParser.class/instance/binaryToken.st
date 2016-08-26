token
binaryToken
	^ super binaryToken
		==> [ :token | 
			(RBBinarySelectorToken value: token value start: token start)
				comments: token comments;
				yourself ]