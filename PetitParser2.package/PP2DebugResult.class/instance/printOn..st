printing
printOn: aStream 
	self parser ifNil: [ ^ super printOn: aStream ].
	aStream 
		nextPutAll: self parser displayName;
		nextPutAll: '[';
		nextPutAll: self parser withoutDebugStrategy displayName;	"first ones are the debugging ones, skip them"
		nextPutAll: ']';
		nextPutAll: '(';
		nextPutAll: self allResults size asString;
"		nextPutAll: ':';
		nextPutAll: self events size asString;
"		nextPutAll: ')';
		nextPutAll: ' - ';   
		nextPutAll: (self result printStringLimitedTo: 50).
