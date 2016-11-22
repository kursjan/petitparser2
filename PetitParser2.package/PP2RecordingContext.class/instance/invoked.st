events
invoked
	| entry |

	entry := PP2InvocationRecord new
		position: self position;
		strategy: self strategy;
		event: #invoked;
		yourself.
		
	eventsTrace addLast: entry