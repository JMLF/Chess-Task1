Class {
	#name : 'MyPawn',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'accessing' }
MyPawn >> id [

	^ 'P'
]

{ #category : 'rendering' }
MyPawn >> renderPieceOn: aSquare [ 
	
	^ aSquare renderPawn: self
]

{ #category : 'rendering' }
MyPawn >> targetSquaresLegal: aBoolean [
	"On se fait des variables"
	"Un pour la colone de 2 du first move et une pour le return"
	| squaresUp possibleMoves |

	"squaresUp := self collectSquares: [ :aSquare | aSquare up ]  legal: false."
	"sinon on utilise while mais comment ?" 
	"On ajoute 2 de plus sur le square"
	 
	possibleMoves := (self isWhite
		   ifTrue: [ { square up } ]
		   ifFalse: [ { square down } ]) select: [ :s |
		  s notNil and: [
			  s hasPiece not or: [ s contents color ~= color ] ] ].
	
	^possibleMoves 
]
