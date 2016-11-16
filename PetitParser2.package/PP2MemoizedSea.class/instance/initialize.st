initialization
initialize
	super initialize.
	"
	Would be nice to call this, but there is some mess in initializations.
	This would be called before underlying strategy knows, what is its node :(
	
	self reset
	"