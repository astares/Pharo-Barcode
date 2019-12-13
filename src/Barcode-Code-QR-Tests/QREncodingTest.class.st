Class {
	#name : #QREncodingTest,
	#superclass : #TestCase,
	#instVars : [
		'encoding'
	],
	#category : #'Barcode-Code-QR-Tests-Utilities'
}

{ #category : #'test data' }
QREncodingTest >> alphanumeric40L [

	^QREncoding 
		version: 40 
		errorCorrection: QRErrorCorrection levelL
		characterSet: QRAlphanumericCharacterSet   
		
]

{ #category : #'test data' }
QREncodingTest >> byte40L [

	^QREncoding 
		version: 40 
		errorCorrection: QRErrorCorrection levelL
		characterSet: QRByteCharacterSet   
		
]

{ #category : #'test data' }
QREncodingTest >> kanji40L [

	^QREncoding 
		version: 40  
		errorCorrection: QRErrorCorrection levelL
		characterSet: QRKanjiCharacterSet
]

{ #category : #'test data' }
QREncodingTest >> numeric40L [

	^QREncoding 
		version: 40   
		errorCorrection: QRErrorCorrection levelL
		characterSet: QRNumericCharacterSet 
]

{ #category : #tests }
QREncodingTest >> setUp [

	super setUp.
	encoding := QREncoding 
					version: 1
					errorCorrection: QRErrorCorrection levelL
					characterSet: QRAlphanumericCharacterSet.
	 
]

{ #category : #tests }
QREncodingTest >> testInstanceCreation [

	| instance |
	instance := QREncoding 
					version: 1															
					errorCorrection: QRErrorCorrection levelL
					characterSet: QRNumericCharacterSet .
	self
		assert: instance version = 1 asQRVersion; 
		assert: instance characterSet = QRNumericCharacterSet;
		assert: instance errorCorrection = QRErrorCorrection levelL 
]

{ #category : #tests }
QREncodingTest >> testMaximumCharacterCapacity [

	self assert: encoding maximumCharacterCapacity = 25.	
	
	self assert: self numeric40L maximumCharacterCapacity = 7089.
	self assert: self alphanumeric40L maximumCharacterCapacity = 4296.
	self assert: self byte40L maximumCharacterCapacity = 2953.
	self assert: self kanji40L maximumCharacterCapacity = 1817.
]

{ #category : #tests }
QREncodingTest >> testTotalNumberOfDataCodewords [

	| instance |
	instance := QREncoding 
					version: 1 asQRVersion															
					errorCorrection: QRErrorCorrection levelQ
					characterSet: QRNumericCharacterSet.
					
	self assert: instance totalNumberOfDataCodewords = 13
]
