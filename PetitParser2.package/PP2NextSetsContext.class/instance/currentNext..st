accessing
currentNext: anObject
	self assert: [ anObject class == IdentitySet ] description: 'if not, override the #hash and #='.
	currentNext := anObject