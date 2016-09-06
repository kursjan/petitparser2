analysis - first
isFirstSetTerminal
	"lets be conservative here"
	self doesFunctionalChanges ifTrue: [  
		^ true
	].

	^ false
