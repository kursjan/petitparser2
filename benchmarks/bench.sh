image="Pharo.image"

while getopts "hdf:" arg; do
  case $arg in
    d) 
      echo "downloading"
      rm -rf Pharo.image
      rm -rf Pharo.changes
      rm -rf testimage.image
      rm -rf testimage.changes

      wget -O- get.pharo.org/60 | bash
      ;;
    f)
      echo "image" 
      image=${OPTARG}
      ;;
    h)
      echo "-t for tests" 
      echo "-d download image" 
      echo "-c for coverage" 
      echo "-f <imagename> to change default image" 
      echo "-h for this help" 
      exit 1 
      ;;
  esac
done
echo "image: ${image}"

pharo_vm=$(grep '^Exec' ~/.local/share/applications/pharo-spur-vm.desktop | tail -1 | sed 's/^Exec=//' | sed 's/%.//')
#pharo_vm_nox="./pharo -vm-display-null"
pharo_vm_nox="${pharo_vm} -vm-display-null"

$pharo_vm_nox -vm-display-null ${image} save benchimage

$pharo_vm_nox benchimage eval --save "
| s b |
Metacello new
	baseline: 'SmaCC';
	repository: 'github://ThierryGoubier/SmaCC:v2.0.5';
	load: 'SmaCC-Smalltalk-Parser'.

Metacello new
	baseline: 'PetitParser2';
	repository: 'filetree:///home/kursjan/Documents/PetitParser2/petitparser2';
	load.

5 timesRepeat: [ Smalltalk garbageCollect ].
	
Transcript crShow: 'warming up...'.
b := PP2Benchmark new.
b benchmarkRBParser.
b benchmarkSmalltalkParser.
b benchmarkSmalltalkParserNoOpt.
b benchmarkSmalltalkParserSmacc.
b showReport.
b showSpeedup.

Transcript crShow: 'running...'; cr.
b := PP2Benchmark new.
b repetitions: 5.
b benchmarkRBParser.
b benchmarkSmalltalkParser.
b benchmarkSmalltalkParserNoOpt.
b benchmarkSmalltalkParserSmacc.
b showReport.
b showSpeedup.

Transcript crShow: 'round two...'; cr.
b benchmarkRBParser.
b benchmarkSmalltalkParser.
b benchmarkSmalltalkParserNoOpt.
b benchmarkSmalltalkParserSmacc.
b showReport.
b showSpeedup.


s := WriteStream on: ''.
b report show: s.
b report speedup: s.
^ s contents
" | tee bench.output

totalResult=`cat bench.output | tail -4`
zenity --notification --text="Bench complete\n ${totalResult}"
