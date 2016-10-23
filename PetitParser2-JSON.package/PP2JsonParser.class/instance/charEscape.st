primitives
charEscape
	^ super charEscape ==> [ :nodes | CharacterTable at: nodes last ]