Class {
	#name : #QRErrorCorrectionTest,
	#superclass : #TestCase,
	#category : #'Barcode-Tests-Core-QR'
}

{ #category : #tests }
QRErrorCorrectionTest >> testComparision [

	self assert: QRErrorCorrection levelH = QRErrorCorrection levelH.
	self deny:  QRErrorCorrection levelH = QRErrorCorrection levelM
]

{ #category : #tests }
QRErrorCorrectionTest >> testLevelH [

	| level |
	level := QRErrorCorrection levelH.
	self 
		assert: level level = #H;
		assert: level errorCorrectionCapability = 30
]

{ #category : #tests }
QRErrorCorrectionTest >> testLevelL [

	| level |
	level := QRErrorCorrection levelL.
	self 
		assert: level level = #L;
		assert: level errorCorrectionCapability = 7
]

{ #category : #tests }
QRErrorCorrectionTest >> testLevelM [

	| level |
	level := QRErrorCorrection levelM.
	self 
		assert: level level = #M;
		assert: level errorCorrectionCapability = 15
]

{ #category : #tests }
QRErrorCorrectionTest >> testLevelQ [

	| level |
	level := QRErrorCorrection levelQ.
	self 
		assert: level level = #Q;
		assert: level errorCorrectionCapability = 25
]

{ #category : #tests }
QRErrorCorrectionTest >> testPrinting [

	self assert: QRErrorCorrection levelQ printString = 'Error Correction Level Q (recovers 25% of data)'
]
