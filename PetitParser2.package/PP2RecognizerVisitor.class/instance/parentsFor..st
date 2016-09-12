accessing
parentsFor: node
	^ parents at: node ifAbsentPut: [ IdentitySet new ]