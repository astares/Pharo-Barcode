Class {
	#name : #QRNumericCharacterSetTest,
	#superclass : #TestCase,
	#category : #'Barcode-Tests-Core-QR'
}

{ #category : #tests }
QRNumericCharacterSetTest >> testModeIndicator [

	self assert: QRNumericCharacterSet modeIndicator = '0001'
]
