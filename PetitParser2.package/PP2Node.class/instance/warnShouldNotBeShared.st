optimizations - warnings
warnShouldNotBeShared
	"give user feedback about this issues"
	| warning |
	warning := self asString, ' should not be shared, because it cannot be optimized'.	
	self addWarning: warning.
