"
This class represents Barcode EAN 8
see
https://barcode-coder.com/en/ean-8-specification-101.html
"
Class {
	#name : #BarcodeEAN8,
	#superclass : #BarcodeEAN,
	#category : #'Barcode-Code-EAN-Base'
}

{ #category : #example }
BarcodeEAN8 class >> example [
	<example>

	(self data: '12345670') asForm inspect
]

{ #category : #defaults }
BarcodeEAN8 >> defaultSize [

	^ 8
]
