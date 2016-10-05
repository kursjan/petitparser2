grammars
grammarB
	"The most stupid parser, it just references itself and never consumes anything. All algorithms should survive such an attack."

	| parser |
	parser := PP2DelegateNode new.
	parser child: parser.
	^ parser