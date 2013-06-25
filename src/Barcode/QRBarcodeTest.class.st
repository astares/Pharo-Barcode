Class {
	#name : #QRBarcodeTest,
	#superclass : #TestCase,
	#instVars : [
		'barcode'
	],
	#category : #'Barcode-Tests-Core-QR'
}

{ #category : #running }
QRBarcodeTest >> setUp [

	super setUp.
	barcode := QRBarcode new.
	barcode encoding: (QREncoding
							version: 40
							characterSet: QRByteCharacterSet
							errorCorrectionLevel: QRErrorCorrectionLevel  levelL).	
 				
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
	self assert: ('2r', expectedIndicator) asNumber =  stringToEncode size.
	
	barcode data: 'HELLO WORLD'.
	barcode encoding: (QREncoding
							version: 1
							characterSet: QRAlphanumericCharacterSet  
							errorCorrectionLevel: QRErrorCorrectionLevel  levelL).	
	self assert: barcode characterCountIndicator = expectedIndicator.
	self assert: (barcode binarySequence copyFrom: 5 to: 13) = expectedIndicator. "start at the fifth position after modeIndicator"
	self assert: (barcode binarySequence copyUpTo: 13) =  '0010000001011'
					
 				
]

{ #category : #tests }
QRBarcodeTest >> testEncoding [

	self assert: barcode encoding notNil
	
]

{ #category : #tests }
QRBarcodeTest >> testModeIndicator [

	|characterSet|
	characterSet := QRAlphanumericCharacterSet.
	barcode encoding: (QREncoding
							version: 1
							characterSet: characterSet 
							errorCorrectionLevel: QRErrorCorrectionLevel  levelL).	
	self assert: (barcode binarySequence copyFrom: 1 to: 4) = characterSet modeIndicator 							
 				
]
