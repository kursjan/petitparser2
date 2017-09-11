parsing
patternToken
    ^ $` asPParser , #letter asPParser plus flatten,
        (${ asPParser , #letter asPParser plus flatten , $} asPParser) optional ,
		$` asPParser