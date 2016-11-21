events
invoked
	| entry |

	entry := PP2InvocationEntry new
		position: self position;
		strategy: self strategy;
		event: #invoked;
		yourself.
		
	eventsTrace addLast: entry