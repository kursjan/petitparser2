grammar-blocks
blockArgumentsWith
	^ blockArgument plus , ($| asPParser smalltalkToken / ($] asPParser smalltalkToken and ==> [ :node | nil ]))