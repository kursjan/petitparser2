parsing - private
parseOn: startContext
	| context elements |

	context := startContext.
	elements := Array new: parsers size.

	1 to: parsers size do: [ :index |
		context := (parsers at: index) parseWithContext: context.
		context isPetit2Failure ifTrue: [ ^ context ].
		elements at: index put: context value ].
	
	^ context retval: elements