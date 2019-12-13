Class {
	#name : #QRBarcodeTest,
	#superclass : #TestCase,
	#instVars : [
		'barcode'
	],
	#category : #'Barcode-Code-QR-Tests-Base'
}

{ #category : #running }
QRBarcodeTest >> setUp [

	super setUp.
	barcode := QRBarcode new.
	barcode encoding: (QREncoding
							version: 40							
							errorCorrection: QRErrorCorrection levelL
							characterSet: QRByteCharacterSet).	
 				
]

{ #category : #tests }
QRBarcodeTest >> testCharacterCountIndicator [
	"The character count indicator is a string of bits that represents the number of characters that
	  are being encoded. The character count indicator must be placed after the mode indicator.
	  Futhermore, the character count indicator must be a certain number of bits long, depending on 
	  QRVersion and character mode.
	"

	|stringToEncode expectedIndicator |
	stringToEncode := 'HELLO WORLD'.
	expectedIndicator := '000001011'. "HELLOWORLD has 11 characters, this is binary 1011"
	self assert: ('2r', expectedIndicator) asNumber equals: stringToEncode size.
	
	barcode data: 'HELLO WORLD'.
	barcode encoding: (QREncoding
							version: 1							 
							errorCorrection: QRErrorCorrection levelQ
							characterSet: QRAlphanumericCharacterSet).	
	self assert: barcode characterCountIndicator equals: expectedIndicator.
	 
]

{ #category : #tests }
QRBarcodeTest >> testEncoding [

	self assert: barcode encoding notNil
	
]

{ #category : #tests }
QRBarcodeTest >> testHelloWorldExample [
	"The character count indicator is a string of bits that represents the number of characters that
	  are being encoded. The character count indicator must be placed after the mode indicator.
	  Futhermore, the character count indicator must be a certain number of bits long, depending on 
	  QRVersion and character mode.
	"

	|stringToEncode expectedIndicator |
	stringToEncode := 'HELLO WORLD'.
	expectedIndicator := '000001011'. "HELLOWORLD has 11 characters, this is binary 1011"
	self assert: ('2r', expectedIndicator) asNumber equals: stringToEncode size.
	
	barcode data: 'HELLO WORLD'.
	barcode encoding: (QREncoding
							version: 1							 
							errorCorrection: QRErrorCorrection levelQ
							characterSet: QRAlphanumericCharacterSet).	

	self assert: (barcode binarySequence copyFrom: 1 to: 4) =  '0010'.                     			"mode indiator"
	self assert: (barcode binarySequence copyFrom: 5 to: 13) = expectedIndicator. 			"start at the fifth position after modeIndicator"	
	self assert: (barcode binarySequence copyFrom: 1 to: 13) =  ('0010', expectedIndicator). "mode indiator and character count indicator"
	 
	self assert: (barcode binarySequence copyFrom: 14 to: 74) =  '0110000101101111000110100010111001011011100010011010100001101' . "encoded data"
									
	self assert: barcode dataBitsString = ('0010', '000001011', '0110000101101111000110100010111001011011100010011010100001101'). "mode indiator and character count indicator and encoded data"
	
	self assert: (barcode binarySequence copyFrom: 75 to: 78) = '0000'.    "terminator, max 4 zeros"
	self assert: (barcode binarySequence copyFrom: 1 to: 78) =  ('0010', '000001011', '0110000101101111000110100010111001011011100010011010100001101', '0000').
   		
	self assert: (barcode binarySequence copyFrom: 79 to: 80) =  '00'. "padded with zeros to length a multiple of 8"	
	self assert: (barcode binarySequence copyFrom: 1 to: 80) =  ('0010', '000001011', '0110000101101111000110100010111001011011100010011010100001101', '0000','00').
	
	self assert: (barcode binarySequence copyFrom: 81 to: 104) =  '111011000001000111101100'. "padded with 236 and 17 sequence until max capacity is reached"
		
]

{ #category : #tests }
QRBarcodeTest >> testModeIndicator [

	|characterSet|
	characterSet := QRAlphanumericCharacterSet.
	barcode encoding: (QREncoding
							version: 1
							errorCorrection: QRErrorCorrection  levelL
							characterSet: characterSet).	
	self assert: (barcode binarySequence copyFrom: 1 to: 4) equals: characterSet modeIndicator 							
 				
]
