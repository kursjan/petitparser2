grammar-blocks
blockArgumentsWith
	^ blockArgument plus , ($| asParser2 smalltalkToken / ($] asParser2 smalltalkToken and ==> [ :node | nil ]))