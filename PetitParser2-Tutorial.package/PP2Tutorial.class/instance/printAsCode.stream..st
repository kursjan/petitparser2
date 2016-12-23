pillar-support
printAsCode: aString stream: stream
	stream nextPutAll: '[[[';
		lf;
		nextPutAll: aString;
		lf;
		nextPutAll: ']]]'.