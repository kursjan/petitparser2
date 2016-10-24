tokens
numberToken
	^ super numberToken ==> [ :token | (token value copyWithout: $+) asLowercase asNumber ]