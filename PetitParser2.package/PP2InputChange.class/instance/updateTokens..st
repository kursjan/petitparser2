updates
updateTokens: node
	| set |
	"make sure you update every token only once ;-)"
	set := IdentitySet new.
	self deepSelectTokens: node into: set.
	
	set do: [ :token | self updateToken: token ].
	