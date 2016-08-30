instance creation
on: aBlock
	^ self basicNew initialize 
		terminalBlock: aBlock;
		yourself