accessing
nextSetFor: node
	^ nextSets at: node ifAbsentPut: [ IdentitySet new ]