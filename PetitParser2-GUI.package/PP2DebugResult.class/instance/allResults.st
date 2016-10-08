analysis
allResults
	^ allChildren ifNil: [  
		| collection |
		collection := IdentitySet new.
		self allResultsTo: collection.
		allChildren := collection	
	]
