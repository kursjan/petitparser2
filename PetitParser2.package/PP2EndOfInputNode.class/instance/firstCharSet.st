accessing
firstCharSet
	"
	 Because the end of input is not 'real' character in the input stream,
	 PP2 cannot compare end of input with a peek character.
	"
	^ PP2UnknownCharSetPredicate instance