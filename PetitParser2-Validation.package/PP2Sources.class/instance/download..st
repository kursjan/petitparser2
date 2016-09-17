download
download: zipFile
	zipFile asFileReference exists ifFalse: [ 
		ZnClient new
			url: self class downloadUrl, zipFile;
			signalProgress: true;
			downloadTo: FileSystem workingDirectory.
	].
	^  (FileSystem zip: zipFile asFileReference) open workingDirectory