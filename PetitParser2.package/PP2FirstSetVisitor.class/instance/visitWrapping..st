visiting
visitWrapping: node
	(self isTerminal: node) ifTrue: [ ^ IdentitySet with: node ].
	"	
		Be conservative, we don't what is happening inside the block, 
		so the whole block serves as a first set terminal.
	"
	
	^ IdentitySet with: node