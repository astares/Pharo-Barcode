Class {
	#name : #QREncoding,
	#superclass : #Object,
	#instVars : [
		'version',
		'errorCorrectionLevel',
		'characterSet'
	],
	#category : #'Barcode-Core-QR'
}

{ #category : #examples }
QREncoding class >> example1 [

	^QREncoding 
		version: 40 
		characterSet: QRNumericCharacterSet   
		errorCorrectionLevel: QRErrorCorrectionLevel levelL
]

{ #category : #'instance creation' }
QREncoding class >> version: version characterSet: characterSet errorCorrectionLevel: errorCorrectionLevel [ 

	^(self new)
		version: version characterSet: characterSet errorCorrectionLevel: errorCorrectionLevel;
		yourself

]

{ #category : #accessing }
QREncoding >> characterCountIndicatorSizeInBits [

	^self characterSet
		characterCountIndicatorSizeInBitsForVersion: version 
]

{ #category : #accessing }
QREncoding >> characterSet [

	^characterSet
]

{ #category : #accessing }
QREncoding >> errorCorrectionLevel [

	^errorCorrectionLevel
]

{ #category : #accessing }
QREncoding >> maximumCharacterCapacity [
	"Return the maximum character capacity of the receiver.
	 Depending on the character set in use each version has a maximum capacity. In addition, the error 
	 correction level restricts the capacity further.
	"
	
	^self characterSet
		maximumCharacterCapacityForVersion: version withErrorCorrecionLevel: errorCorrectionLevel  
]

{ #category : #printing }
QREncoding >> printOn: aStream [

	aStream 
		nextPutAll: 'Version: ';
		nextPutAll: version asString;
		cr;
		nextPutAll: 'Mode ';
		nextPutAll: mode asString;
		cr;
		nextPutAll: 'Error correction level: ';
		nextPutAll: errorCorrectionLevel  asString				 

]

{ #category : #accessing }
QREncoding >> version [

	^version
]

{ #category : #accessing }
QREncoding >> version: aVersion characterSet: aCharacterSet errorCorrectionLevel: anErrorCorrectionLevel [ 

	version := aVersion.
	characterSet := aCharacterSet.
	errorCorrectionLevel := anErrorCorrectionLevel
]
