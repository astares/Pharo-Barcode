"
FNC1 mode allows the QR code to function as a GS1 barcode.
"
Class {
	#name : #QRFNC1SecondPositionCharacterSet,
	#superclass : #QREncodableCharacterSet,
	#category : #'Barcode-Code-QR-CharacterSets'
}

{ #category : #accessing }
QRFNC1SecondPositionCharacterSet class >> modeIndicator [

	^'1001'
]
