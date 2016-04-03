operators
>=> aBlock
	"Answer a new parser that performs aBlock as action handler on success."

	^ PP2WrappingParser on: self block: aBlock