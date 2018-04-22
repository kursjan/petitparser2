updates
updateParser: node
	node ifNil: [ ^ self ].
	node allReparsables do: [ :reparsable |
		reparsable buffer: (self updateBuffer: reparsable buffer).
	]