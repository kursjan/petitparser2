enumerating
allElementsDo: aBlock
	^ self allElementsDo: aBlock seen: IdentitySet new