analysis
allChildren
	self halt.
	^ allChildren ifNil: [  
		| collection |
		collection := IdentitySet new.
		self allChildrenTo: collection.
		allChildren := collection	
	]
