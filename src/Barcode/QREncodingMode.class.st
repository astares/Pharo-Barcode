"
Abstract superclass for modes of encoding
"
Class {
	#name : #QREncodingMode,
	#superclass : #Object,
	#category : #'Barcode-Core-QR'
}

{ #category : #accessing }
QREncodingMode class >> capacityTable [
	"Return the capacity table in the form of #((LMQH) (LMQH) (LQMH) ...) for each of the 40 versions."

	^self subclassResponsibility 
]

{ #category : #accessing }
QREncodingMode class >> maximumCharacterCapacityForVersion: version withErrorCorrecionLevel: errorCorrectionLevel [ 
	| index |
	index := {QRErrorCorrectionLevel levelL. 
			   QRErrorCorrectionLevel levelM. 
			   QRErrorCorrectionLevel levelQ. 
			   QRErrorCorrectionLevel levelH} indexOf: errorCorrectionLevel.  
	^(self capacityTable at: version) at: index
]

{ #category : #accessing }
QREncodingMode class >> modeIndicator [

	^self subclassResponsibility 
]
