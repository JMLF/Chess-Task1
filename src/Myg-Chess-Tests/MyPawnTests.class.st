Class {
	#name : 'MyPawnTests',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyPawnTests >> testBlackCannotGoToTheSide [

   | pawn squares board row|
   board := MyChessBoard empty.
   board at: 'e2' put: (pawn := MyPawn black asMoved: false).

    squares := pawn targetSquares.
   row := pawn square. 
   
    self assert: (squares anySatisfy: [:each | #('d2' 'f2') includes: each name ]) not
]

{ #category : 'tests' }
MyPawnTests >> testBlackCannotGoToTheSideAfterFirstMove [

   | pawn squares board row|
   board := MyChessBoard empty.
   board at: 'e2' put: (pawn := MyPawn black asMoved: true).

    squares := pawn targetSquares.
   row := pawn square. 
   
    self assert: (squares anySatisfy: [:each | #('d2' 'f2') includes: each name ]) not
]

{ #category : 'tests' }
MyPawnTests >> testBlackCannotGoUpOutside [

   | pawn squares board row|
   board := MyChessBoard empty.
   board at: 'e1' put: (pawn := MyPawn black asMoved: true).

    squares := pawn targetSquares.
   row := pawn square. 
   
    self assert: squares isEmpty 
]

{ #category : 'tests' }
MyPawnTests >> testBlackFirstMoveOneSquare [
	"Pawn should be able to move for 1 square for their first move"
	| pawn squares board |
	board := MyChessBoard empty.
	board at: 'e7' put: (pawn := MyPawn black asMoved: false).

	squares := pawn targetSquares.
	self
		assertCollection: squares
		includesAll:
			(#( e6 ) collect: [ :name |
				 board at: name ])
]

{ #category : 'tests' }
MyPawnTests >> testBlackFirstMoveTwoSquare [
	"Pawn should be able to move 1 or 2 square for their first move"
	| pawn squares board |
	board := MyChessBoard empty.
	board at: 'e7' put: (pawn := MyPawn black asMoved: false).

	squares := pawn targetSquares.
	self
		assertCollection: squares
		includesAll:
			(#( e5 ) collect: [ :name |
				 board at: name ])
]

{ #category : 'tests' }
MyPawnTests >> testBlackMoveDown [
	"Pawn should be able to move on the next square"
	| pawn squares board |
	board := MyChessBoard empty.
	board at: 'c5' put: (pawn := MyPawn black asMoved: true).

	squares := pawn targetSquares.
	self
		assertCollection: squares
		includesAll:
			(#( c4 ) collect: [ :name |
				 board at: name ])
]

{ #category : 'tests' }
MyPawnTests >> testBlackMovesDownLeftWithOponentObstacle [

	| pawn squares board |
	board := MyChessBoard empty.
	board at: 'c4' put: (pawn := MyPawn black asMoved: true).

	"Sould be able tu eat the opponent on down right"
	board at: 'b3' put: (MyPawn white asMoved: true).

	squares := pawn targetSquares.
	self assert: (squares anySatisfy: [ :each | each name = 'b3' ]) 
]

{ #category : 'tests' }
MyPawnTests >> testBlackMovesDownRightWithOponentObstacle [

	| pawn squares board |
	board := MyChessBoard empty.
	board at: 'c4' put: (pawn := MyPawn black asMoved: true).

	"Sould be able tu eat the opponent on down right"
	board at: 'd3' put: (MyPawn white asMoved: true).

	squares := pawn targetSquares.
	self assert: (squares anySatisfy: [ :each | each name = 'd3' ]) 
]

{ #category : 'tests' }
MyPawnTests >> testBlackMovesDownWithOponentObstacle [

	| pawn squares board |
	board := MyChessBoard empty.
	board at: 'c5' put: (pawn := MyPawn black asMoved: true).

	"Sould not pass with a blocking opponent"
	board at: 'c4' put: (MyPawn white asMoved: true) .

	squares := pawn targetSquares.
	self assert: squares isEmpty
]

{ #category : 'tests' }
MyPawnTests >> testBlackMovesDownWithSameColorObstacle [

	| pawn squares board |
	board := MyChessBoard empty.
	board at: 'c5' put: (pawn := MyPawn black asMoved: true).

	"Sould not pass with a blocking pawn"
	board at: 'c4' put: (MyPawn black asMoved: true).

	squares := pawn targetSquares.
	self assert: ((squares anySatisfy: [ :each | each name = 'c4' ]) not) 
]

{ #category : 'tests' }
MyPawnTests >> testId [
	"L'id de la pièce doit être P"
	self assert: MyPawn new id equals: 'P'

]

{ #category : 'tests' }
MyPawnTests >> testWhiteCannotGoToTheSide [

   | pawn squares board row|
   board := MyChessBoard empty.
   board at: 'e2' put: (pawn := MyPawn white asMoved: false).

    squares := pawn targetSquares.
   row := pawn square. 
   
    self assert: (squares anySatisfy: [:each | #('d2' 'f2') includes: each name ]) not
]

{ #category : 'tests' }
MyPawnTests >> testWhiteCannotGoToTheSideAfterFirstMove [

   | pawn squares board row|
   board := MyChessBoard empty.
   board at: 'e2' put: (pawn := MyPawn white asMoved: true).

    squares := pawn targetSquares.
   row := pawn square. 
   
    self assert: (squares anySatisfy: [:each | #('d2' 'f2') includes: each name ]) not
]

{ #category : 'tests' }
MyPawnTests >> testWhiteCannotGoUpOutside [

   | pawn squares board row|
   board := MyChessBoard empty.
   board at: 'e8' put: (pawn := MyPawn white asMoved: true).

    squares := pawn targetSquares.
   row := pawn square. 
   
    self assert: squares isEmpty 
]

{ #category : 'tests' }
MyPawnTests >> testWhiteFirstMoveOneSquare [
	"Pawn should be able to move for 1 square for their first move"
	| pawn squares board |
	board := MyChessBoard empty.
	board at: 'e2' put: (pawn := MyPawn white asMoved: false).

	squares := pawn targetSquares.
	self
		assertCollection: squares
		includesAll:
			(#( e3 ) collect: [ :name |
				 board at: name ])
]

{ #category : 'tests' }
MyPawnTests >> testWhiteFirstMoveTwoSquare [
	"Pawn should be able to move for 2 square for their first move"
	| pawn squares board |
	board := MyChessBoard empty.
	board at: 'e2' put: (pawn := MyPawn white asMoved: false).

	squares := pawn targetSquares.
	self
		assertCollection: squares
		includesAll:
			(#( e4 ) collect: [ :name |
				 board at: name ])
]

{ #category : 'tests' }
MyPawnTests >> testWhiteMoveUp [
	"Pawn should be able to move on the next square"
	| pawn squares board |
	board := MyChessBoard empty.
	board at: 'c4' put: (pawn := MyPawn white asMoved: true).

	squares := pawn targetSquares.
	self
		assertCollection: squares
		includesAll:
			(#( c5 ) collect: [ :name |
				 board at: name ])
]

{ #category : 'tests' }
MyPawnTests >> testWhiteMovesUpLeftWithOponentObstacle [

	| pawn squares board |
	board := MyChessBoard empty.
	board at: 'c4' put: (pawn := MyPawn white asMoved: true).

	"Sould be able tu eat the opponent on top left"
	board at: 'b5' put: (MyPawn black asMoved: true).

	squares := pawn targetSquares.
	self assert: (squares anySatisfy: [ :each | each name = 'b5' ]) 
]

{ #category : 'tests' }
MyPawnTests >> testWhiteMovesUpRightWithOponentObstacle [

	| pawn squares board |
	board := MyChessBoard empty.
	board at: 'c4' put: (pawn := MyPawn white asMoved: true).

	"Sould be able tu eat the opponent on top right"
	board at: 'd5' put: (MyPawn black asMoved: true).

	squares := pawn targetSquares.
	self assert: (squares anySatisfy: [ :each | each name = 'd5' ]) 
]

{ #category : 'tests' }
MyPawnTests >> testWhiteMovesUpWithOponentObstacle [

	| pawn squares board |
	board := MyChessBoard empty.
	board at: 'c4' put: (pawn := MyPawn white asMoved:true).

	"Sould not pass with a blocking opponent"
	board at: 'c5' put: (MyPawn black asMoved: true).

	squares := pawn targetSquares.
	self assert: (squares anySatisfy: [ :each | each name = 'c5' ]) not 
]

{ #category : 'tests' }
MyPawnTests >> testWhiteMovesUpWithSameColorObstacle [

	| pawn squares board |
	board := MyChessBoard empty.
	board at: 'c4' put: (pawn := MyPawn white asMoved: true).

	"Sould not pass with a blocking pawn"
	board at: 'c5' put: (MyPawn white asMoved: true).

	squares := pawn targetSquares.
	self assert: (squares anySatisfy: [ :each | each name = 'c5' ]) not 
]
