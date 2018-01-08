parsing
patternToken
    ^ $` asPParser , #letter asPParser plus flatten,
        (${ asPParser , ((#any asPParser starLazy: $} asPParser) flatten) , $} asPParser) optional ,
		$` asPParser