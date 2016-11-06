memoization
remember: context
	"TODO JK: make it working with other than default stacks"
	^ PP2PopMemento new 
		position: context rememberPosition;
		stackSize: context defaultStack size;
		stackTop: context defaultStack top;
		yourself
	