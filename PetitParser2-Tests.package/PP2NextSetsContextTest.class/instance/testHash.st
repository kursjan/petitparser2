as yet unclassified
testHash
	context1 currentNext: (IdentitySet with: o1 with: o2).
	context2 currentNext: (IdentitySet with: o2 with: o1).
	
	self assert: context1 hash equals: context2 hash. 