grammar
statements
	^ 	(expression wrapped , ((periodToken plus , statements ==> [ :nodes | nodes first , nodes last ])
								/ periodToken star)
			==> [ :nodes | (Array with: nodes first) , (nodes last) ])
	/	(return , periodToken star
			==> [ :nodes | (Array with: nodes first) , (nodes last) ])
	/	(periodToken star)