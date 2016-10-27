as yet unclassified
testEqual
	context1 currentNext: (IdentitySet with: o1 with: o2).
	context2 currentNext: (IdentitySet with: o2 with: o1).
	
	self deny: context1 == context2.
	self assert: context1 = context2.