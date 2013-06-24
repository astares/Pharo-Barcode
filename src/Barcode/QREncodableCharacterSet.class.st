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

{ #category : #accessing }
QREncodableCharacterSet class >> maximumCharacterCapacityForVersion: version withErrorCorrecionLevel: errorCorrectionLevel [ 
	| index |
	index := {QRErrorCorrectionLevel levelL. 
			   QRErrorCorrectionLevel levelM. 
			   QRErrorCorrectionLevel levelQ. 
			   QRErrorCorrectionLevel levelH} indexOf: errorCorrectionLevel.  
	^(self capacityTable at: version) at: index
]

{ #category : #accessing }
QREncodableCharacterSet class >> modeIndicator [

	^self subclassResponsibility 
]
