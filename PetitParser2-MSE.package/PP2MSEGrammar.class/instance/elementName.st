basic
elementName
	^ (#word asPParser star flatten , 
		( $. asPParser , #word asPParser star flatten ) optional) token trim