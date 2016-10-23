accessing
cell
	^ whitespace star , nonComma star flatten , whitespace star
		==> [ :nodes | nodes second value ]