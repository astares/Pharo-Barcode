"
Kanji mode is for double-byte characters from the Shift JIS character set. While UTF-8 can encode Kanji characters, it must use three or four bytes to do so. Shift JIS, on the other hand, uses just two bytes to encode each Kanji character, so Kanji mode compresses Kanji characters more efficiently. If the entire input string consists of characters in the double-byte range of Shift JIS, use Kanji mode. It is also possible to use multiple modes within the same QR code.
"
Class {
	#name : #QRKanjiCharacterSet,
	#superclass : #QREncodableCharacterSet,
	#category : #'Barcode-Code-QR-CharacterSets'
}

{ #category : #'private accessing' }
QRKanjiCharacterSet class >> capacityTable [ 
	"Return the capacity table in the form of #((LMQH) (LMQH) (LQMH) ...) for each of the 40 versions."

	^#((10 8 7 4) (20 16 12 8) (32 26 20 15) (48 38 28 21) (65 52 37 27) (82 65 45 36) (95 75 53 39) (118 93 66 52) (141 111 80 60) (167 131 93 74) (198 155 109 85) (226 177 125 96) (262 204 149 109) (282 223 159 120) (320 254 180 136) (361 277 198 154) (397 310 224 173) (442 345 243 191) (488 384 272 208) (528 410 297 235) (572 438 314 248) (618 480 348 270) (672 528 376 284) (721 561 407 315) (784 614 440 330) (842 652 462 365) (902 692 496 385) (940 732 534 405) (1002 778 559 430) (1066 843 604 457) (1132 894 634 486) (1201 947 684 518) (1273 1002 719 553) (1347 1060 756 590) (1417 1113 790 605) (1496 1176 832 647) (1577 1224 876 673) (1661 1292 923 701) (1729 1362 972 750) (1817 1435 1024 784))
]

{ #category : #accessing }
QRKanjiCharacterSet class >> characterCountIndicatorSizeInBitsForVersion: version [

	((1 to: 9) includes: version) ifTrue: [ ^8 "bits" ].
	((10 to: 26) includes: version) ifTrue: [ ^10 "bits" ].
	((27 to: 40) includes: version) ifTrue: [ ^12 "bits" ].
	self error: 'bad version (only 1 to 40 allowed)'
]

{ #category : #accessing }
QRKanjiCharacterSet class >> modeIndicator [

	^'1000'
]
