Class {
	#name : #QRECICharacterSetTest,
	#superclass : #TestCase,
	#category : #'Barcode-Code-QR-Tests-CharacterSets'
}

{ #category : #tests }
QRECICharacterSetTest >> testModeIndicator [

	self assert: QRECICharacterSet modeIndicator equals: '0111'
]
