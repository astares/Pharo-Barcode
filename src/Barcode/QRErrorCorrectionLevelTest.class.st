Class {
	#name : #QRErrorCorrectionLevelTest,
	#superclass : #TestCase,
	#category : #'Barcode-Tests-Core-QR'
}

{ #category : #tests }
QRErrorCorrectionLevelTest >> testLevelH [

	| level |
	level := QRErrorCorrectionLevel levelH.
	self 
		assert: level level = #H;
		assert: level errorCorrectionCapability = 30
]

{ #category : #tests }
QRErrorCorrectionLevelTest >> testLevelL [

	| level |
	level := QRErrorCorrectionLevel levelL.
	self 
		assert: level level = #L;
		assert: level errorCorrectionCapability = 7
]

{ #category : #tests }
QRErrorCorrectionLevelTest >> testLevelM [


	| level |
	level := QRErrorCorrectionLevel levelM.
	self 
		assert: level level = #M;
		assert: level errorCorrectionCapability = 15
]

{ #category : #tests }
QRErrorCorrectionLevelTest >> testLevelQ [

	| level |
	level := QRErrorCorrectionLevel levelQ.
	self 
		assert: level level = #Q;
		assert: level errorCorrectionCapability = 25
]
