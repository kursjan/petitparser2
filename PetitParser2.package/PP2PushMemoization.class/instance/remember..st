memoization
remember: context
	"TODO JK: make it working with other than default stacks"
	^ PP2PushMemento new 
		position: context rememberPosition;
		stackSize: context defaultStack size;
		yourself
	