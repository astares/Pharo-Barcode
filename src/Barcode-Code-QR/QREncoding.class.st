"
QR code encoding
"
Class {
	#name : #QREncoding,
	#superclass : #Object,
	#instVars : [
		'version',
		'errorCorrection',
		'characterSet'
	],
	#category : #'Barcode-Code-QR-Utilities'
}

{ #category : #examples }
QREncoding class >> example [
	<sampleInstance>

	^ self
		  version: 40 asQRVersion
		  errorCorrection: QRErrorCorrection levelL
		  characterSet: QRNumericCharacterSet
]

{ #category : #examples }
QREncoding class >> example1 [

	^QREncoding 
		version: 40 asQRVersion
		errorCorrection: QRErrorCorrection levelL
		characterSet: QRNumericCharacterSet   
		
]

{ #category : #'instance creation' }
QREncoding class >> version: version errorCorrection: errorCorrection characterSet: characterSet [

	^ self new
		  version: version asQRVersion
		  errorCorrection: errorCorrection
		  characterSet: characterSet;
		  yourself
]

{ #category : #accessing }
QREncoding >> characterCountIndicatorSizeInBits [

	^self characterSet
		characterCountIndicatorSizeInBitsForVersion: version number
]

{ #category : #accessing }
QREncoding >> characterSet [

	^characterSet
]

{ #category : #accessing }
QREncoding >> errorCorrection [ 

	^errorCorrection 
]

{ #category : #accessing }
QREncoding >> maximumCharacterCapacity [
	"Return the maximum character capacity of the receiver.
	 Depending on the character set in use each version has a maximum capacity. In addition, the error 
	 correction level restricts the capacity further.
	"
	
	^self characterSet
		maximumCharacterCapacityForVersion: version withErrorCorrection: self errorCorrection
]

{ #category : #printing }
QREncoding >> printOn: aStream [

	aStream 
		nextPutAll: 'Version: ';
		nextPutAll: self version asString;
		cr;
		nextPutAll: 'Chaacter Set ';
		nextPutAll: self characterSet asString;
		cr;
		nextPutAll: 'Error correction level: ';
		nextPutAll: self errorCorrection asString				 

]

{ #category : #accessing }
QREncoding >> totalNumberOfDataCodewords [

	|blockInfo|
	blockInfo := QRBlockInformation version: self version errorCorrection: self errorCorrection.
	^blockInfo totalNumberOfDataCodewords
]

{ #category : #accessing }
QREncoding >> version [

	^version
]

{ #category : #accessing }
QREncoding >> version: aVersion errorCorrection: anErrorCorrection characterSet: aCharacterSet [

	version := aVersion.
	errorCorrection := anErrorCorrection.
	characterSet := aCharacterSet
	
]
