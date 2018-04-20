visiting
visitEndOfLine: parser
    ^ (self isEndOfLine: currentContext)
        ifTrue: [ ^ nil ]
        ifFalse: [ PP2Failure message: 'end of line expected' context: currentContext ]