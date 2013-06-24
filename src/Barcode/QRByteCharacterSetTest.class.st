Class {
	#name : #QRByteCharacterSetTest,
	#superclass : #TestCase,
	#instVars : [
		'characterSet'
	],
	#category : #'Barcode-Tests-Core-QR'
}

{ #category : #accessing }
QRByteCharacterSetTest >> defaultTestClass [

	^QRByteCharacterSet
]

{ #category : #running }
QRByteCharacterSetTest >> setUp [ 

	super setUp.
	characterSet := self defaultTestClass.
]

{ #category : #tests }
QRByteCharacterSetTest >> testModeIndicator [

	self assert: characterSet modeIndicator = '0100'
]
