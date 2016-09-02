instance creation
on: aBlock
	^ self basicNew initialize 
		terminalBlock: aBlock;
		predicateBlock: aBlock;
		yourself