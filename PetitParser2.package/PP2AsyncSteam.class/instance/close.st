initialize-release
close
	closed := true.
	"I need to queue some character at the end, because next is waiting for an input"
	accessSemaphore critical: [ self queueChar: (Character codePoint: 4) ].