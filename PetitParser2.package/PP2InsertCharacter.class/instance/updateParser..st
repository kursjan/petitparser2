updates
updateParser: node
	node allReparsables do: [ :reparsable |
		reparsable buffer: (self updateBuffer: reparsable buffer).
	]