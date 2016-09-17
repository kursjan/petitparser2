download
downloadUI: zipFile
	zipFile asFileReference exists ifFalse: [ 
		UIManager default informUserDuring: [ :bar |
			bar label: 'Downloading ...'.
			[ ZnClient new
				url: self class downloadUrl, zipFile;
				signalProgress: true;
				downloadTo: FileSystem workingDirectory ]
			on: HTTPProgress 
			do: [ :progress |
				progress isEmpty ifFalse: [ 
					bar current: progress percentage.
					progress total ifNotNil: [ :aTotalNumber |
						bar label: 'Downloading ' ] ].
				progress resume ] 
		]	
	].
	^  (FileSystem zip: zipFile asFileReference) open workingDirectory