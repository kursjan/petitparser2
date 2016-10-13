copying
postCopy
	"JK: I am not sure, if this works properly for optimized version!"
	super postCopy.
	
	properties := properties copy.
	strategy := strategy copy.
	strategy node: self