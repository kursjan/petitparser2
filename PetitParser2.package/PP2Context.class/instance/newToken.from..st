tokenization
newToken: tokenClass from: start
	^ stream newToken: tokenClass from: start + 1 to: position