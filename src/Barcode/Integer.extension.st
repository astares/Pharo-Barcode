Extension { #name : #Integer }

{ #category : #'*Barcode-Core-QR' }
Integer >> asQRVersion [

	^QRVersion nr: self 
]
