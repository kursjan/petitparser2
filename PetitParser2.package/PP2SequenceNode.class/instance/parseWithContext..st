parsing - private
parseWithContext: startContext
	| context elements |

	context := startContext.
	elements := Array new: children size.

	1 to: children size do: [ :index |
		context := (children at: index) parseWithContext: context.
		context isPetit2Failure ifTrue: [ ^ context ].
		elements at: index put: context value ].
	
	^ context retval: elements