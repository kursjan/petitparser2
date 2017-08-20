parsing
rewritePattern
	^ $` asPParser , #letter asPParser plus , $` asPParser
		, (${ asPParser , #letter asPParser plus flatten , $} asPParser) optional