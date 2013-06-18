Class {
	#name : #QREncoding,
	#superclass : #Object,
	#instVars : [
		'version',
		'errorCorrectionLevel',
		'mode'
	],
	#category : #'Barcode-Core-QR'
}

{ #category : #examples }
QREncoding class >> example1 [

	^QREncoding 
		version: 40 
		mode: QRNumericEncodingMode   
		errorCorrectionLevel: QRErrorCorrectionLevel levelL
]

{ #category : #'instance creation' }
QREncoding class >> version: version mode: mode errorCorrectionLevel: errorCorrectionLevel [ 

	^(self new)
		version: version mode: mode errorCorrectionLevel: errorCorrectionLevel;
		yourself

]

{ #category : #accessing }
QREncoding >> errorCorrectionLevel [

	^errorCorrectionLevel
]

{ #category : #accessing }
QREncoding >> maximumCharacterCapacity [
	"Return the maximum character capacity of the receiver.
	 Depending on the mode in use each version has a maximum capacity. In addition, the error 
	 correction level restricts the capacity further.
	"
	
	^self mode
		maximumCharacterCapacityForVersion: version withErrorCorrecionLevel: errorCorrectionLevel  
]

{ #category : #accessing }
QREncoding >> mode [

	^mode
]

{ #category : #accessing }
QREncoding >> version [

	^version
]

{ #category : #accessing }
QREncoding >> version: aVersion mode: aMode errorCorrectionLevel: anErrorCorrectionLevel [ 

	version := aVersion.
	mode := aMode.
	errorCorrectionLevel := anErrorCorrectionLevel
]
