as yet unclassified
testHashNotEqual
	context1 currentNext: (IdentitySet with: o1 with: o2).
	context2 currentNext: (IdentitySet with: o2 with: o1 with: o3).
	
	self deny: context1 hash = context2 hash. 