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
		version: 40 asQRVersion
		errorCorrectionLevel: QRErrorCorrectionLevel levelL
		characterSet: QRNumericCharacterSet   
		
]

{ #category : #'instance creation' }
QREncoding class >> version: version errorCorrectionLevel: errorCorrectionLevel characterSet: characterSet [

	^(self new)
		version: version asQRVersion errorCorrectionLevel: errorCorrectionLevel characterSet: characterSet ;
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
		nextPutAll: 'Chaacter Set ';
		nextPutAll: characterSet asString;
		cr;
		nextPutAll: 'Error correction level: ';
		nextPutAll: errorCorrectionLevel  asString				 

]

{ #category : #accessing }
QREncoding >> version [

	^version
]

{ #category : #accessing }
QREncoding >> version: aVersion errorCorrectionLevel: anErrorCorrectionLevel characterSet: aCharacterSet [

	version := aVersion.
	errorCorrectionLevel := anErrorCorrectionLevel.
	characterSet := aCharacterSet
	
]
