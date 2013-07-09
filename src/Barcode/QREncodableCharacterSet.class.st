"
Abstract superclass for modes of encoding
"
Class {
	#name : #QREncodableCharacterSet,
	#superclass : #Object,
	#category : #'Barcode-Core-QR'
}

{ #category : #accessing }
QREncodableCharacterSet class >> capacityTable [
	"Return the capacity table in the form of #((LMQH) (LMQH) (LQMH) ...) for each of the 40 versions."

	^self subclassResponsibility 
]

{ #category : #accessing }
QREncodableCharacterSet class >> characterCountIndicatorSizeInBitsForVersion: version [

	self subclassResponsibility 
]

{ #category : #encoding }
QREncodableCharacterSet class >> encode: aDataString [

	self subclassResponsibility 
]

{ #category : #accessing }
QREncodableCharacterSet class >> maximumCharacterCapacityForVersion: version withErrorCorrecionLevel: errorCorrectionLevel [ 
	| index |
	index := {QRErrorCorrection levelL. 
			   QRErrorCorrection levelM. 
			   QRErrorCorrection levelQ. 
			   QRErrorCorrection levelH} indexOf: errorCorrectionLevel.  
	^(self capacityTable at: version number) at: index
]

{ #category : #accessing }
QREncodableCharacterSet class >> modeIndicator [

	^self subclassResponsibility 
]

{ #category : #private }
QREncodableCharacterSet class >> verifyEncodable: aDataString [

	aDataString do: [:character | (self canEncode: character) ifFalse: [ self error: 'Can not encode character' ]].
]
