#!/bin/bash

./pharo "Pharo.image" save "PharoPP2"

./pharo "PharoPP2.image" eval --save "
| repo |
repo := './..' asFileReference.
repo := repo absolutePath segments inject: 'filetree://' into: [ :path :seg | path, '/', seg ].
Metacello new
	baseline: 'PetitParser2';
	repository: repo;
	load: 'PetitParser2-Headless'.
"
