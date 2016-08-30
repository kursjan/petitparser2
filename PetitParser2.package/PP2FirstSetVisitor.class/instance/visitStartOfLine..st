visiting
visitStartOfLine: node
	(self isTerminal: node) ifTrue: [ ^ IdentitySet with: node ].
	
	self warn: 'guess you have some issues with your terminal block'