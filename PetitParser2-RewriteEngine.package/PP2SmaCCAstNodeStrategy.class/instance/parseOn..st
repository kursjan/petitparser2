parsing
parseOn: context
	| retval |
	(retval := node child parseOn: context) isPetit2Failure ifTrue: [ 
		^  self pattern parseOn: context
	].

	^ PP2RewriteAstNode new
		children: retval asCollection;
		completeSource: context asSmaCCString;
		yourself