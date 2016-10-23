tokens
numberToken
	^ super numberToken ==> [ :token | (token inputValue copyWithout: $+) asLowercase asNumber ]