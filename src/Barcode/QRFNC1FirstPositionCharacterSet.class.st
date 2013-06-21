"
FNC1 mode allows the QR code to function as a GS1 barcode.
"
Class {
	#name : #QRFNC1FirstPositionCharacterSet,
	#superclass : #QREncodableCharacterSet,
	#category : #'Barcode-Core-QR'
}

{ #category : #accessing }
QRFNC1FirstPositionCharacterSet class >> modeIndicator [

	^'0101'
]
