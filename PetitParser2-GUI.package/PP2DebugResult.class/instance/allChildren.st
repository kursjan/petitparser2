analysis
allChildren
	^ allChildren ifNil: [  
		| collection |
		collection := IdentitySet new.
		self allChildrenTo: collection.
		allChildren := collection	
	]
