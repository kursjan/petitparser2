accessing
event: value
	| entry |

	entry := PP2ProfilingEntry new
		position: self position;
		strategy: self strategy;
		event: value;
		yourself.
		
	entries addLast: entry