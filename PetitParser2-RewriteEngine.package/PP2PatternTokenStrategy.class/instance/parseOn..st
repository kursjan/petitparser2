parsing
parseOn: context
    | start parseValue patternToken |
    start := context position.
    (parseValue := self pattern parseOn: context) isPetit2Failure ifTrue: [ ^ parseValue ].

    patternToken := (context newToken: PP2PatternToken from: start)
        name: parseValue second;
        yourself.
    self testBlock: parseValue into: patternToken.
    ^ patternToken