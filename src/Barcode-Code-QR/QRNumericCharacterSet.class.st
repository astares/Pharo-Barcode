"
Numeric mode is for decimal digits 0 through 9 - so it is just encoding digits, thus being able to pack a lot of data in one picture
"
Class {
	#name : #QRNumericCharacterSet,
	#superclass : #QREncodableCharacterSet,
	#category : #'Barcode-Code-QR-CharacterSets'
}

{ #category : #'private accessing' }
QRNumericCharacterSet class >> allowedCharacters [

	^$0 to: $9
]

{ #category : #testing }
QRNumericCharacterSet class >> canEncode: aCharacter [

	^self allowedCharacters includes: aCharacter
]

{ #category : #'private accessing' }
QRNumericCharacterSet class >> capacityTable [
	"Return the capacity table in the form of #((LMQH) (LMQH) (LQMH) ...) for each of the 40 versions."

	^#((41 34 27 17) (77 63 48 34) (127 101 77 58) (187 149 111 82) (255 202 144 106) (322 255 178 139) (370 293 207 154) (461 365 259 202) (552 432 312 235) (652 513 364 288) (772 604 427 331) (883 691 489 374) (1022 796 580 427) (1101 871 621 468) (1250 991 703 530) (1408 1082 775 602) (1548 1212 876 674) (1725 1346 948 746) (1903 1500 1063 813) (2061 1600 1159 919) (2232 1708 1224 969) (2409 1872 1358 1056) (2620 2059 1468 1108) (2812 2188 1588 1228) (3057 2395 1718 1286) (3283 2544 1804 1425) (3517 2701 1933 1501) (3669 2857 2085 1581) (3909 3035 2181 1677) (4158 3289 2358 1782) (4417 3486 2473 1897) (4686 3693 2670 2022) (4965 3909 2805 2157) (5253 4134 2949 2301) (5529 4343 3081 2361) (5836 4588 3244 2524) (6153 4775 3417 2625) (6479 5039 3599 2735) (6743 5313 3791 2927) (7089 5596 3993 3057))
]

{ #category : #accessing }
QRNumericCharacterSet class >> characterCountIndicatorSizeInBitsForVersion: version [

	((1 to: 9) includes: version) ifTrue: [ ^10 "bits" ].
	((10 to: 26) includes: version) ifTrue: [ ^12 "bits" ].
	((27 to: 40) includes: version) ifTrue: [ ^14 "bits" ].
	self error: 'bad version (only 1 to 40 allowed)'
]

{ #category : #accessing }
QRNumericCharacterSet class >> encode: aDataString [
	"The input data string is divided into groups of three digits, and each group is converted to its 10 bit binary equivalent. If the number of input digits is not an exact multiple of three, the final one or two digits are converted to 4 or 7 bits respectively."
	|bitsToUse  |
	self verifyEncodable: aDataString.
	bitsToUse := #(4 7 10).
	^String streamContents: [:stream |
		(aDataString splitIntoChunksOfMaxSize: 3) do: [:each |			 
			stream nextPutAll: (((each asNumber printStringRadix: 2) allButFirst: 2) padLeftTo: (bitsToUse at: each size) with: $0)  ]]
	
	
]

{ #category : #accessing }
QRNumericCharacterSet class >> modeIndicator [

	^'0001'
]
