optimizations - warnings
warnShouldNotBeShared
	"give user feedback about this issues"
	| warning |
	warning := self displayName, ' should not be shared, because it cannot be optimized'.	
	self addWarning: warning.
