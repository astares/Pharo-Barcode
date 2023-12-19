"
Abstract superclass for modes of encoding
"
Class {
	#name : #QREncodableCharacterSet,
	#superclass : #Object,
	#category : #'Barcode-Code-QR-CharacterSets'
}

{ #category : #'private - accessing' }
QREncodableCharacterSet class >> capacityTable [
	"Return the capacity table in the form of #((LMQH) (LMQH) (LQMH) ...) for each of the 40 versions."

	^ self subclassResponsibility
]

{ #category : #accessing }
QREncodableCharacterSet class >> characterCountIndicatorSizeInBitsForVersion: version [

	self subclassResponsibility 
]

{ #category : #encoding }
QREncodableCharacterSet class >> encode: aDataString [

	self subclassResponsibility 
]

{ #category : #testing }
QREncodableCharacterSet class >> isAbstract [

	^ self == QREncodableCharacterSet
]

{ #category : #accessing }
QREncodableCharacterSet class >> maximumCharacterCapacityForVersion: version withErrorCorrection: errorCorrection [

	| index |
	index := {QRErrorCorrection levelL.
			   QRErrorCorrection levelM.
			   QRErrorCorrection levelQ.
			   QRErrorCorrection levelH} indexOf: errorCorrection.
	^ (self capacityTable at: version number) at: index
]

{ #category : #accessing }
QREncodableCharacterSet class >> modeIndicator [

	^ self subclassResponsibility
]

{ #category : #private }
QREncodableCharacterSet class >> verifyEncodable: aDataString [

	aDataString do: [:character | (self canEncode: character) ifFalse: [ self error: 'Can not encode character' ]]
]
