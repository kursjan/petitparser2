initialize-release
close
	closed := true.
	"I need to queue some character at the end, because next is waiting for an input"
	queue addLast: (Character codePoint: 4).