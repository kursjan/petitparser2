visiting
visitEndOfInput: parser
    ^ currentContext atEnd
        ifTrue: [ nil ]
        ifFalse: [ PP2Failure message: 'end of input expected' context: currentContext ]