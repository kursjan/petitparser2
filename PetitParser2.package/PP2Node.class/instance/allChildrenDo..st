enumerating
allChildrenDo: aBlock
	^ self allChildrenDo: aBlock seen: IdentitySet new