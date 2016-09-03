enumerating
allNodesDo: aBlock
	^ self allNodesDo: aBlock seen: IdentitySet new