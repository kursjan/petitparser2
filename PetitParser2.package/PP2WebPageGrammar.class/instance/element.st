element
element
	^ elOpen,
		elContent,
	elClose
	
	map: [ :_open :_body :_close | 
		_open second = _close second ifFalse: [ 
			^ PP2Failure message: 'tags do not match'
		].
		Array with: _open with: _body with: _close
	]