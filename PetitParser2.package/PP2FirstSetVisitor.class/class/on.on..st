instance creation
on: terminalBlock on: predicateBlock
	^ self basicNew 
		terminalBlock: terminalBlock;
		predicateBlock: predicateBlock;
		initialize;
		yourself