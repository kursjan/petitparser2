events
namedInvoked
	| entry |

	entry := PP2InvocationRecord new
		position: self position;
		strategy: self strategy;
		event: #namedInvoked;
		yourself.
		
	eventsTrace addLast: entry