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

	| possibleMoves |
	possibleMoves := OrderedCollection new.

	"Déplacement d'une case vers l'avant"
	"Suivant la couleur on monte ou on descent de un"
	"Si la case suivante est pas null et est vide on ajoute le coup"
	(self isWhite
		 ifTrue: [ square up ]
		 ifFalse: [ square down ]) ifNotNil: [ :frontSquare |
		frontSquare hasPiece ifFalse: [
			possibleMoves add: frontSquare.

			"Déplacement de deux cases si le pion n'a pas encore bougé"
			"Si en plus de précedement la piece n'a jamais été bougé on ajoute un up/down sur le coup précedent et on le met dans les coups possibles"
			self asMoved ifFalse: [
				(self isWhite
					 ifTrue: [ frontSquare up ]
					 ifFalse: [ frontSquare down ]) ifNotNil: [ :twoSquaresAhead |
					twoSquaresAhead hasPiece ifFalse: [
						possibleMoves add: twoSquaresAhead ] ] ] ] ].

	(self isWhite
		 ifTrue: [ "On verrifie si up n'est pas nill, si up est nill c'est qu'on a pas le droit au move donc pas besoin d'aller plus loin on laisse passer le nill"
			 square up ifNotNil: [ :squareUpWhite | squareUpWhite left ] ]
		 ifFalse: [
		 square down ifNotNil: [ :squareDownBlack | squareDownBlack left ] ])
		ifNotNil: [ :leftSquare |
			leftSquare hasPiece ifTrue: [
				leftSquare contents color ~= self color ifTrue: [
					possibleMoves add: leftSquare ] ] ].

	(self isWhite
		 ifTrue: [
		 square up ifNotNil: [ :squareUpWhite | squareUpWhite right ] ]
		 ifFalse: [
		 square down ifNotNil: [ :squareDownBlack | squareDownBlack right ] ])
		ifNotNil: [ :rightSquare |
			rightSquare hasPiece ifTrue: [
				rightSquare contents color ~= self color ifTrue: [
					possibleMoves add: rightSquare ] ] ].

	"@TODO il faut gerer le déplacement diagonale et le coup special"


	^ possibleMoves
]
