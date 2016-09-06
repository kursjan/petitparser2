visiting
visitWrapping: parser
	^ parser block value: currentContext value: [ self visit: parser child  ]