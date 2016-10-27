as yet unclassified
testEqualNot
	context1 currentNext: (IdentitySet with: o1 with: o2).
	context2 currentNext: (IdentitySet with: o2 with: o3).
	
	self deny: context1 == context2.
	self deny: context1 = context2.