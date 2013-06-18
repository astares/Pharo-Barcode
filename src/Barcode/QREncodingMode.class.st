Class {
	#name : #QREncodingMode,
	#superclass : #Object,
	#category : #'Barcode-Core-QR'
}

{ #category : #accessing }
QREncodingMode class >> capacityTable [

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
