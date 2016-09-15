printing
printOn: aStream 
	self parser ifNil: [ ^ super printOn: aStream ].
	aStream 
		nextPutAll: self parser displayName;
		nextPutAll: '[';
		nextPutAll: self parser withoutDebugStrategy displayName;	"first one is the debugging one, skip it"
		nextPutAll: ']';
		nextPutAll: '(';
		nextPutAll: self allChildren size asString;
"		nextPutAll: ':';
		nextPutAll: self events size asString;
"		nextPutAll: ')';
		nextPutAll: ' - ';   
		nextPutAll: (self result printStringLimitedTo: 20).
