instance creation
on: node block: aBlock
	^ self new
		child: node;
		block: aBlock;
		yourself