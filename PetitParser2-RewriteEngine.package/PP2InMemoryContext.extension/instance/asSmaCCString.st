*PetitParser2-RewriteEngine
asSmaCCString
	^ self globalAt: #SmaccString ifAbsentPut: [ (Smalltalk at: #SmaCCString) on: collection ]