optimizations - warnings
warnActionInToken
	"
		(($a asParser2, $b asParser2) ==> [ :e | e second ] token) optimize
	"
	| warning |
	warning := self asString, ' is in token, there shouldnt be actions in tokens. but it might be necessary, I admit :('.
	
	self addWarning: warning.
