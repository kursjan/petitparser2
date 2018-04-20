visiting
visitStartOfLine: parser
    ^ (self isStartOfLine: currentContext)
        ifTrue: [ ^ nil ]
        ifFalse: [ PP2Failure message: 'start of line expected' context: currentContext ]