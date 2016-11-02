initialization
resetMemoizationStrategy
	Halt if: [ Sensor shiftPressed ].
	memoizationStrategy := PP2CSMemoization new