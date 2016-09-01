comparing
localHash
	"
		This method is supposed to be overriden by children
	"

	^ self class hash bitXor: self name hash