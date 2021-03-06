"
8-bit Byte mode, by default, is for characters from the ISO-8859-1 character set. However, some QR code scanners can automatically detect if UTF-8 is used in byte mode instead.
"
Class {
	#name : #QRByteCharacterSet,
	#superclass : #QREncodableCharacterSet,
	#category : #'Barcode-Code-QR-CharacterSets'
}

{ #category : #testing }
QRByteCharacterSet class >> canEncode: aCharacter [

	^aCharacter asInteger < 256
]

{ #category : #'private accessing' }
QRByteCharacterSet class >> capacityTable [
	"Return the capacity table in the form of #((LMQH) (LMQH) (LQMH) ...) for each of the 40 versions."

	^#((17 14 11 7) (32 26 20 14) (53 42 32 24) (78 62 46 34) (106 84 60 44) (134 106 74 58) (154 122 86 64) (192 152 108 84) (230 180 130 98) (271 213 151 119) (321 251 177 137) (367 287 203 155) (425 331 241 177) (458 362 258 194) (520 412 292 220) (586 450 322 250) (644 504 364 280) (718 560 394 310) (792 624 442 338) (858 666 482 382) (929 711 509 403) (1003 779 565 439) (1091 857 611 461) (1171 911 661 511) (1273 997 715 535) (1367 1059 751 593) (1465 1125 805 625) (1528 1190 868 658) (1628 1264 908 698) (1732 1370 982 742) (1840 1452 1030 790) (1952 1538 1112 842) (2068 1628 1168 898) (2188 1722 1228 958) (2303 1809 1283 983) (2431 1911 1351 1051) (2563 1989 1423 1093) (2699 2099 1499 1139) (2809 2213 1579 1219) (2953 2331 1663 1273))
]

{ #category : #accessing }
QRByteCharacterSet class >> characterCountIndicatorSizeInBitsForVersion: version [

	((1 to: 9) includes: version) ifTrue: [ ^8 "bits" ].
	((10 to: 40) includes: version) ifTrue: [ ^16 "bits" ].
	self error: 'bad version (only 1 to 40 allowed)'
]

{ #category : #encoding }
QRByteCharacterSet class >> encode: aDataString [
 
	self verifyEncodable: aDataString.
	
	^String streamContents: [:stream |
		aDataString do: [:character |				 		   
			stream nextPutAll: (((character asInteger printStringRadix: 2) allButFirst: 2) padLeftTo: 8 with: $0) ]]
	
]

{ #category : #accessing }
QRByteCharacterSet class >> modeIndicator [

	^'0100'
]
