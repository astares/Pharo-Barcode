Class {
	#name : #BarcodeExtensionsTest,
	#superclass : #TestCase,
	#category : #'Barcode-Core-Tests-Base'
}

{ #category : #testing }
BarcodeExtensionsTest >> testSplitIntoChunksOfSize [

	self assert: ('' splitIntoChunksOfMaxSize: 3) = #().
	self assert: ('A' splitIntoChunksOfMaxSize: 3) = #('A').	
	self assert: ('AB' splitIntoChunksOfMaxSize: 3) = #('AB').
	self assert: ('ABC' splitIntoChunksOfMaxSize: 3) = #('ABC').
	self assert: ('ABCD' splitIntoChunksOfMaxSize: 3) = #('ABC' 'D').
	
	self assert: ('ABCDEFGH' splitIntoChunksOfMaxSize: 1)	= #('A' 'B' 'C' 'D' 'E' 'F' 'G' 'H').
	self assert: ('ABCDEFGH' splitIntoChunksOfMaxSize: 2)	= #('AB' 'CD' 'EF' 'GH').
	self assert: ('ABCDEFGH' splitIntoChunksOfMaxSize: 3)	= #('ABC' 'DEF' 'GH').
	
	self assert: (#() splitIntoChunksOfMaxSize: 1) = #().
	self assert: (#() splitIntoChunksOfMaxSize: 2) = #().
	
	self assert: (#(1 2 3 4 5 6 7)  splitIntoChunksOfMaxSize: 1) = #(#(1) #(2) #(3) #(4) #(5) #(6) #(7)).	
	self assert: (#(1 2 3 4 5 6 7)  splitIntoChunksOfMaxSize: 2) = #(#(1 2) #(3 4) #(5 6) #(7)).		
	self assert: (#(1 2 3 4 5 6 7) splitIntoChunksOfMaxSize: 3)  = #(#(1 2 3) #(4 5 6) #(7)).
	
]
