Class {
	#name : #BarcodeExtensionsTest,
	#superclass : #TestCase,
	#category : #'Barcode-Core-Tests-Base'
}

{ #category : #testing }
BarcodeExtensionsTest >> testSplitIntoChunksOfSize [

	self assert: ('' splitIntoChunksOfMaxSize: 3) equals: #().
	self assert: ('A' splitIntoChunksOfMaxSize: 3) equals: #('A').	
	self assert: ('AB' splitIntoChunksOfMaxSize: 3) equals: #('AB').
	self assert: ('ABC' splitIntoChunksOfMaxSize: 3) equals: #('ABC').
	self assert: ('ABCD' splitIntoChunksOfMaxSize: 3) equals: #('ABC' 'D').
	
	self assert: ('ABCDEFGH' splitIntoChunksOfMaxSize: 1) equals: #('A' 'B' 'C' 'D' 'E' 'F' 'G' 'H').
	self assert: ('ABCDEFGH' splitIntoChunksOfMaxSize: 2) equals: #('AB' 'CD' 'EF' 'GH').
	self assert: ('ABCDEFGH' splitIntoChunksOfMaxSize: 3) equals: #('ABC' 'DEF' 'GH').
	
	self assert: (#() splitIntoChunksOfMaxSize: 1) equals: #().
	self assert: (#() splitIntoChunksOfMaxSize: 2) equals: #().
	
	self assert: (#(1 2 3 4 5 6 7)  splitIntoChunksOfMaxSize: 1) equals: #(#(1) #(2) #(3) #(4) #(5) #(6) #(7)).	
	self assert: (#(1 2 3 4 5 6 7)  splitIntoChunksOfMaxSize: 2) equals: #(#(1 2) #(3 4) #(5 6) #(7)).		
	self assert: (#(1 2 3 4 5 6 7) splitIntoChunksOfMaxSize: 3) equals: #(#(1 2 3) #(4 5 6) #(7))
	
]
