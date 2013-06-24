Class {
	#name : #QRECICharacterSetTest,
	#superclass : #TestCase,
	#category : #'Barcode-Tests-Core-QR'
}

{ #category : #tests }
QRECICharacterSetTest >> testModeIndicator [

	self assert: QRECICharacterSet modeIndicator = '0111'
]
