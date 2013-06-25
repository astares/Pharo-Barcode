"
A BarcodeEAN13Test is a test class for testing the behavior of BarcodeEAN13
"
Class {
	#name : #BarcodeEAN13Test,
	#superclass : #TestCase,
	#instVars : [
		'barcode'
	],
	#category : #'Barcode-Tests-Core'
}

{ #category : #running }
BarcodeEAN13Test >> setUp [

	super setUp.
	barcode := BarcodeEAN13 data: '2109876543210'.
]

{ #category : #tests }
BarcodeEAN13Test >> testBinarySequence [

	barcode data: '2109876543210'.
	self assert: barcode binarySequence = '10100110010001101001011100010010111011000010101010100111010111001000010110110011001101110010101'	
]

{ #category : #tests }
BarcodeEAN13Test >> testComputeChecksum [

	barcode data: '2109876543210'.
	self assert: barcode computeChecksum = 0.

	barcode data: '2109876523212'.
	self assert: barcode computeChecksum = 2	
]

{ #category : #'tests-private' }
BarcodeEAN13Test >> testLeftBinarySequence [

	self assert: (String streamContents: [:s | barcode leftBinarySequenceOn: s for: '2109876'])
		equals: '001100100011010010111000100101110110000101'
	 
	
]

{ #category : #'tests-private' }
BarcodeEAN13Test >> testLeftRuleTable [

	self assert: barcode leftRuleTable size = 10
]

{ #category : #'tests-private' }
BarcodeEAN13Test >> testRightBinarySequence [

	self assert: (String streamContents: [:s | barcode rightBinarySequenceOn: s for: '543210'])
		equals: '100111010111001000010110110011001101110010'
	 
	
]

{ #category : #'tests-private' }
BarcodeEAN13Test >> testRightRuleTable [

	self assert: barcode rightRuleTable size = 10
]

{ #category : #tests }
BarcodeEAN13Test >> testValidChecksum [

	barcode data: '2109876543210'.
	self assert: barcode hasValidCheckSum 
]
