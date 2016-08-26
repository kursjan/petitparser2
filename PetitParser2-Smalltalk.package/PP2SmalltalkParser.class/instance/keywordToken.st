token
keywordToken
	^ super keywordToken
		==> [ :token | 
			(RBKeywordToken value: token value start: token start)
				comments: token comments;
				yourself ]