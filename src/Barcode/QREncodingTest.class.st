Class {
	#name : #QREncodingTest,
	#superclass : #TestCase,
	#instVars : [
		'encoding'
	],
	#category : #'Barcode-Tests-Core-QR'
}

{ #category : #tests }
QREncodingTest >> setUp [

	super setUp.
	encoding := QREncoding 
					version: 1
					mode: QRAlphanumericEncodingMode  										
					errorCorrectionLevel: QRErrorCorrectionLevel levelL.
	 
]

{ #category : #tests }
QREncodingTest >> testInstanceCreation [

	| instance |
	instance := QREncoding 
					version: 1
					mode: QRNumericEncodingMode 										
					errorCorrectionLevel: QRErrorCorrectionLevel levelL.
	self
		assert: instance version = 1; 
		assert: instance mode = QRNumericEncodingMode;
		assert: instance errorCorrectionLevel = QRErrorCorrectionLevel levelL 
]

{ #category : #tests }
QREncodingTest >> testMaximumCharacterCapacity [

	self assert: encoding maximumCharacterCapacity = 25	
]
