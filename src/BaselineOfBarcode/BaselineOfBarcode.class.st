"
The baseline of Barcode project https://github.com/astares/Pharo-Barcode
"
Class {
	#name : #BaselineOfBarcode,
	#superclass : #BaselineOf,
	#category : #BaselineOfBarcode
}

{ #category : #baseline }
BaselineOfBarcode >> baseline: spec [
	<baseline>
	
	spec 
		for: #common
		do: [ 
			spec blessing: #baseline.
								
			"Packages"
			spec 
				package: 'Barcode-Core';
				package: 'Barcode-Core-Tests' with: [ spec requires: #('Barcode-Core') ];	
				
				package: 'Barcode-Code-EAN' with: [ spec requires: #('Barcode-Core') ];	
				package: 'Barcode-Code-EAN-Tests' with: [ spec requires: #('Barcode-Core-Tests' 'Barcode-Code-EAN') ];
				
				package: 'Barcode-Code-QR' with: [ spec requires: #('Barcode-Core') ];	
				package: 'Barcode-Code-QR-Tests' with: [ spec requires: #('Barcode-Core-Tests' 'Barcode-Code-EAN') ].		
				
			"Groups"
			spec
				group: 'Core' with: #('Barcode-Core' 'Barcode-Code-EAN' 'Barcode-Code-QR');		
				group: 'Tests' with: #('Barcode-Core-Tests' 'Barcode-Code-EAN-Tests' 'Barcode-Code-QR-Tests'); 			
				group: 'all' with: #('Core' 'Tests');
				group: 'default' with: #('all') ].
]
