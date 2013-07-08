Class {
	#name : #QREncodingTest,
	#superclass : #TestCase,
	#instVars : [
		'encoding'
	],
	#category : #'Barcode-Tests-Core-QR'
}

{ #category : #'test data' }
QREncodingTest >> alphanumeric40L [

	^QREncoding 
		version: 40 
		errorCorrectionLevel: QRErrorCorrectionLevel levelL
		characterSet: QRAlphanumericCharacterSet   
		
]

{ #category : #'test data' }
QREncodingTest >> byte40L [

	^QREncoding 
		version: 40 
		errorCorrectionLevel: QRErrorCorrectionLevel levelL
		characterSet: QRByteCharacterSet   
		
]

{ #category : #'test data' }
QREncodingTest >> kanji40L [

	^QREncoding 
		version: 40  
		errorCorrectionLevel: QRErrorCorrectionLevel levelL
		characterSet: QRKanjiCharacterSet
]

{ #category : #'test data' }
QREncodingTest >> numeric40L [

	^QREncoding 
		version: 40   
		errorCorrectionLevel: QRErrorCorrectionLevel levelL
		characterSet: QRNumericCharacterSet 
]

{ #category : #tests }
QREncodingTest >> setUp [

	super setUp.
	encoding := QREncoding 
					version: 1
					errorCorrectionLevel: QRErrorCorrectionLevel levelL
					characterSet: QRAlphanumericCharacterSet.
	 
]

{ #category : #tests }
QREncodingTest >> testInstanceCreation [

	| instance |
	instance := QREncoding 
					version: 1															
					errorCorrectionLevel: QRErrorCorrectionLevel levelL
					characterSet: QRNumericCharacterSet .
	self
		assert: instance version = 1; 
		assert: instance characterSet = QRNumericCharacterSet;
		assert: instance errorCorrectionLevel = QRErrorCorrectionLevel levelL 
]

{ #category : #tests }
QREncodingTest >> testMaximumCharacterCapacity [

	self assert: encoding maximumCharacterCapacity = 25.	
	
	self assert: self numeric40L maximumCharacterCapacity = 7089.
	self assert: self alphanumeric40L maximumCharacterCapacity = 4296.
	self assert: self byte40L maximumCharacterCapacity = 2953.
	self assert: self kanji40L maximumCharacterCapacity = 1817.
]
