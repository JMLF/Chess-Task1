Class {
	#name : 'MyPawnTests',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyPawnTests >> testClassicMove [
	"Pawn should be able to move 1 or 2 square for their first move"
	| pawn squares board |
	board := MyChessBoard empty.
	board at: 'c4' put: (pawn := MyPawn white).

	squares := pawn targetSquares.
	self
		assertCollection: squares
		includesAll:
			(#( c5 ) collect: [ :name |
				 board at: name ])
]

{ #category : 'tests' }
MyPawnTests >> testFirstMove [
	"Pawn should be able to move 1 or 2 square for their first move"
	| pawn squares board row|
	board := MyChessBoard empty.
	board at: 'e2' put: (pawn := MyPawn white).

	squares := pawn targetSquares.
	row := pawn square. 
	self
		assertCollection: squares
		includesAll:
			(#( e3 e4 ) collect: [ :name |
				 board at: name ])
]

{ #category : 'tests' }
MyPawnTests >> testId [
	"L'id de la pièce doit être P"
	self assert: MyPawn new id equals: 'P'

]

{ #category : 'tests' }
MyPawnTests >> testMovesWithOponentObstacle [

	| pawn squares board |
	board := MyChessBoard empty.
	board at: 'c4' put: (pawn := MyPawn white).

	"Sould not pass with a blocking opponent"
	board at: 'c5' put: MyPawn black.

	squares := pawn targetSquares.
	self assert: squares isEmpty
]

{ #category : 'tests' }
MyPawnTests >> testMovesWithSameColorObstacle [

	| pawn squares board |
	board := MyChessBoard empty.
	board at: 'c4' put: (pawn := MyPawn white).

	"Sould not pass with a blocking pawn"
	board at: 'c5' put: MyPawn white.

	squares := pawn targetSquares.
	self assert: squares isEmpty
]
