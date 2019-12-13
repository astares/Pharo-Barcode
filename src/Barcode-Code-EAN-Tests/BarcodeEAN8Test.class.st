Class {
	#name : #BarcodeEAN8Test,
	#superclass : #TestCase,
	#instVars : [
		'barcode'
	],
	#category : #'Barcode-Code-EAN-Tests-Base'
}

{ #category : #running }
BarcodeEAN8Test >> setUp [

	super setUp.
	barcode := BarcodeEAN8 data: '764543210'.
]

{ #category : #tests }
BarcodeEAN8Test >> testBinarySequence [

	barcode data: '12345670'.
	self assert: barcode binarySequence = '1010011001001001101111010100011010101001110101000010001001110010101'	
	 
]

{ #category : #tests }
BarcodeEAN8Test >> testComputeChecksum [

	barcode data: '76543210'.
	self assert: barcode computeChecksum = 0.
]

{ #category : #'tests-private' }
BarcodeEAN8Test >> testLeftBinarySequence [

	self assert: (String streamContents: [:s | barcode leftBinarySequenceOn: s for: '1234'])
		equals: '0011001001001101111010100011'
]

{ #category : #'tests-private' }
BarcodeEAN8Test >> testLeftRuleTable [

	self assert: barcode leftRuleTable size = 10
]

{ #category : #'tests-private' }
BarcodeEAN8Test >> testRightBinarySequence [

	self assert: (String streamContents: [:s | barcode rightBinarySequenceOn: s for: '5670'])
		equals: '1001110101000010001001110010'
	 
	
]

{ #category : #'tests-private' }
BarcodeEAN8Test >> testRightRuleTable [

	self assert: barcode rightRuleTable size = 10
]

{ #category : #tests }
BarcodeEAN8Test >> testValidChecksum [

	barcode data: '76543210'.
	self assert: barcode hasValidCheckSum 
]
