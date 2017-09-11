parsing
parseOn: context
    | start retval |
    start := context position.
    (retval := self pattern parseOn: context) isPetit2Failure ifTrue: [ ^ retval ].

    ^ (context newToken: PP2PatternToken from: start)
        testBlock: (self testBlock: retval);
		  name: retval second;
        yourself