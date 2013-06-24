Class {
	#name : #QRByteCharacterSetTest,
	#superclass : #TestCase,
	#category : #'Barcode-Tests-Core-QR'
}

{ #category : #tests }
QRByteCharacterSetTest >> testModeIndicator [

	self assert: QRByteCharacterSet modeIndicator = '0100'
]
