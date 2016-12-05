#!/bin/bash

./pharo "Pharo.image" eval --save "
repo := './..' asFileReference.
repo := repo absolutePath segments inject: 'filetree://' into: [ :path :seg | path, '/', seg ].
Metacello new
	baseline: 'PetitParser2';
	repository: repo;
	load: 'PetitParser2-Headless'.
"
