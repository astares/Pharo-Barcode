Class {
	#name : #QRErrorCorrectionTest,
	#superclass : #TestCase,
	#category : #'Barcode-Code-QR-Tests-Utilities'
}

{ #category : #tests }
QRErrorCorrectionTest >> testComparision [

	self assert: QRErrorCorrection levelH equals: QRErrorCorrection levelH.
	self deny:  QRErrorCorrection levelH equals: QRErrorCorrection levelM
]

{ #category : #tests }
QRErrorCorrectionTest >> testLevelH [

	| level |
	level := QRErrorCorrection levelH.
	self 
		assert: level level equals: #H;
		assert: level errorCorrectionCapability equals: 30
]

{ #category : #tests }
QRErrorCorrectionTest >> testLevelL [

	| level |
	level := QRErrorCorrection levelL.
	self 
		assert: level level equals: #L;
		assert: level errorCorrectionCapability equals: 7
]

{ #category : #tests }
QRErrorCorrectionTest >> testLevelM [

	| level |
	level := QRErrorCorrection levelM.
	self 
		assert: level level equals: #M;
		assert: level errorCorrectionCapability equals: 15
]

{ #category : #tests }
QRErrorCorrectionTest >> testLevelQ [

	| level |
	level := QRErrorCorrection levelQ.
	self 
		assert: level level equals: #Q;
		assert: level errorCorrectionCapability equals: 25
]

{ #category : #tests }
QRErrorCorrectionTest >> testPrinting [

	self assert: QRErrorCorrection levelQ printString equals: 'Error Correction Level Q (recovers 25% of data)'
]
