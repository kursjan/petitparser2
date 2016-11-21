events
namedInvoked
	| entry |

	entry := PP2InvocationEntry new
		position: self position;
		strategy: self strategy;
		event: #namedInvoked;
		yourself.
		
	eventsTrace addLast: entry