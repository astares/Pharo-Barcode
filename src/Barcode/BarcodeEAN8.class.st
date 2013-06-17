Class {
	#name : #BarcodeEAN8,
	#superclass : #BarcodeEAN,
	#category : #'Barcode-Core-EAN'
}

{ #category : #example }
BarcodeEAN8 class >> example [

	^self value: '12345670'
]

{ #category : #defaults }
BarcodeEAN8 >> defaultSize [

	^8
]
