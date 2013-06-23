Class {
	#name : #QRBarcodeTest,
	#superclass : #TestCase,
	#category : #'Barcode-Tests-Core-QR'
}

{ #category : #tests }
QRBarcodeTest >> testEncoding [

	|barcode|
	barcode := QRBarcode new.
	barcode encoding: (QREncoding
							version: 40
							characterSet: QRByteCharacterSet
							errorCorrectionLevel: QRErrorCorrectionLevel  levelL).
	self assert: barcode encoding notNil
	
]
