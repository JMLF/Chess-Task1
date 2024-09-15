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
	| possibleMoves |
	
	possibleMoves := OrderedCollection new.
	
    "Déplacement d'une case vers l'avant"
	"Suivant la couleur on monte ou on descent de un"
	"Si la case suivante est pas null et est vide on ajoute le coup"	
    (self isWhite ifTrue: [square up] ifFalse: [square down]) ifNotNil: [:frontSquare |
        frontSquare hasPiece ifFalse: [
            possibleMoves add: frontSquare.
            
            "Déplacement de deux cases si le pion n'a pas encore bougé"
				"Si en plus de précedement la piece n'a jamais été bougé on ajoute un up/down sur le coup précedent et on le met dans les coups possibles"
            self asMoved ifFalse: [
                (self isWhite ifTrue: [frontSquare up] ifFalse: [frontSquare down]) ifNotNil: [:twoSquaresAhead |
                    twoSquaresAhead hasPiece ifFalse: [
                        possibleMoves add: twoSquaresAhead.
                    ]
                ]
            ]
        ]
    ].
	
	(self isWhite ifTrue: [square up left] ifFalse: [square down left]) ifNotNil: [:leftSquare |
        leftSquare hasPiece ifTrue: [ 
			(leftSquare contents color ~= self color) ifTrue: [possibleMoves add: leftSquare] .
	 ]
].

	(self isWhite ifTrue: [square up right] ifFalse: [square down right]) ifNotNil: [:rightSquare |
        rightSquare hasPiece ifTrue: [ 
			(rightSquare contents color ~= self color) ifTrue: [possibleMoves add: rightSquare] .
	 ]
].
	"@TODO erreur si on a deux piece en haut du plateau on a un send to nill sur left"
	"@TODO il faut gerer le déplacement diagonale et le coup special"
	 
	"possibleMoves addAll: ( (self isWhite
		   ifTrue: [ { square up } ]
		   ifFalse: [ { square down } ]) select: [ :s |
		  s notNil and: [
			  s hasPiece not or: [ s contents color ~= color ] ] ]) ."
	
	^possibleMoves 
]
