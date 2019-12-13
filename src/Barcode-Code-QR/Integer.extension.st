Extension { #name : #Integer }

{ #category : #'*Barcode-Code-QR' }
Integer >> asQRVersion [

	^QRVersion nr: self 
]
