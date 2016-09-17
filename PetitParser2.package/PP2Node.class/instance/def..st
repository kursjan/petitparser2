operators
def: node
	"Redefine the receiver as the argument 'node'. This method is useful when defining recursive parsers: instantiate a PP2UnresolvedNode and later redefine it with another one."

	^ self becomeForward: (node name: self name)