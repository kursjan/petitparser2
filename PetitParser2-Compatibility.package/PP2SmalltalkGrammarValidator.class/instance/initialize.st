initialization
initialize
	super initialize.
	ppParser := PPSmalltalkGrammar new.
	pp2Parser := PPSmalltalkGrammar new asPetit2Parser.
	