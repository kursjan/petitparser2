pillar-support
sourceForScript: selector
	| lines |
	lines := Character cr split: (self sourceFor: selector).
	lines	removeFirst.
	lines removeFirst.
	lines removeLast.
	^ Character cr join: lines.