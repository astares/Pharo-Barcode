Class {
	#name : #QRBlockInformationTest,
	#superclass : #TestCase,
	#category : #'Barcode-Code-QR-Tests-Utilities'
}

{ #category : #accessing }
QRBlockInformationTest >> defaultTestClass [

	^ QRBlockInformation
]

{ #category : #testing }
QRBlockInformationTest >> testBlockInfoTable [

	self assert: self defaultTestClass blockInfoTable size equals: 40. "versions"

	self defaultTestClass blockInfoTable do: [ :row |
		self assert: row size equals: 4 "error correction levels" ]
]

{ #category : #testing }
QRBlockInformationTest >> testBlockInfoTotalDataCodewords [
	
	|info totalDataCodewords|
	self defaultTestClass blockInfoTable do: [ :row |
		row do: [:spec | 
			info := self defaultTestClass fromSpecArray: spec.
			totalDataCodewords := info numberOfDataCodewordsInEachOfGroup1sBlocks * info numberOfBocksInGroup1.
			info hasExtendedSpec ifTrue: [ totalDataCodewords := totalDataCodewords + (info numberOfDataCodewordsInEachOfGroup2sBlocks * info numberOfBocksInGroup2) ].
			self assert: info totalNumberOfDataCodewords equals: totalDataCodewords ]]

	 
]

{ #category : #testing }
QRBlockInformationTest >> testInstanceCreation [

	| info |
	info := self defaultTestClass 
				version: 1 asQRVersion															
				errorCorrection: QRErrorCorrection levelL.
	self assert: info totalNumberOfDataCodewords equals: 19.
	self assert: info errorCorrectionCodewordsPerBlock equals: 7.
	self assert: info numberOfBocksInGroup1 equals: 1.
	self assert: info numberOfDataCodewordsInEachOfGroup1sBlocks equals: 19 				
						

]

{ #category : #testing }
QRBlockInformationTest >> testInstanceCreation5Q [

	| info |
	info := self defaultTestClass 
				version: 5 asQRVersion															
				errorCorrection: QRErrorCorrection levelQ.	
	self assert: info totalNumberOfDataCodewords equals: 62.
	self assert: info errorCorrectionCodewordsPerBlock equals: 18.
	self assert: info numberOfBocksInGroup1 equals: 2.
	self assert: info numberOfDataCodewordsInEachOfGroup1sBlocks equals: 15.	
	self assert: info numberOfBocksInGroup2 equals: 2.
	self assert: info numberOfDataCodewordsInEachOfGroup2sBlocks equals: 16		
						

]
