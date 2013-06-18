Class {
	#name : #QREncodingMode,
	#superclass : #Object,
	#category : #'Barcode-Core-QR'
}

{ #category : #accessing }
QREncodingMode class >> modeIndicator [

	^self subclassResponsibility 
]
