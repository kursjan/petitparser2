accessing
event: value
	| entry |

	entry := PP2EventRecord new
		position: self position;
		strategy: self strategy;
		event: value;
		yourself.
		
	eventsTrace addLast: entry