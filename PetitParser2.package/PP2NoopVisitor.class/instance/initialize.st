initialization
initialize
	cache := Dictionary new.
	openSet := Set new.
	closeSet := Set new.
	
	"to manage parents"
	openStack := Stack with: self rootContext.