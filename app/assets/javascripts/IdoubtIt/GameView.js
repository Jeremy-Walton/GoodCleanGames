function gameView($scope, $timeout) {
	if(!$(".Idoubtit")[0]) {

	} else {
		$scope.game = new Game();
		$scope.game.addPlayer("Jeremy");
		$scope.game.addPlayer("Sam");
		$scope.game.setup();
		$scope.result = "Take your turn!";

		$scope.newGame = function() {
			$scope.game = new Game();
			$scope.game.addPlayer("Jeremy");
			$scope.game.addPlayer("Sam");
			$scope.game.setup();
			$scope.result = "Take your turn!";
			$scope.cards = $scope.game.players[0].hand.cards;
		}

		$scope.saveGame = function() {
			if (input = prompt("What name would you like to save it under")) {
				jsongame = JSON.stringify($scope.game)
				$.ajax({
					url: '/games',
					data: {game_type: "I Doubt It", name: input, data: jsongame},
					data_type: "application/json",
					method: "post"
				});
			}
		}

		$scope.cards = $scope.game.players[0].hand.cards;
		$scope.unselectedCards = function (cards) {
			return cards.filter(function (card) {
				return !card.selected;
			});
		}
		$scope.selectedCards = function (cards) {
			return cards.filter(function (card) {
				return card.selected;
			});
		}

		$scope.loadGame = function() {
			if (input = prompt("What game would you like to load?")) {
				$.ajax({
					url: '/games/lookup',
					data: {game_type: "I Doubt It", name: input},
					success: function(data) {
						gameData = Object.toObject(data);
						$scope.game = gameData;
						$scope.cards = $scope.game.players[0].hand.cards;
						$scope.$apply();
					}
				});
			}
		}
		
		$scope.playerNames = function() {
			var playerNames = "";
			for (var i = 0; i < $scope.game.players.length; i++) {
				playerNames += " | " + $scope.game.players[i].name + " | ";
			}
			return playerNames;
		}

		$scope.discardPile = function() {
			if ($scope.game.discardPile.size() > 0) {
				return "/assets/cards/backs_blue.png";
			} else {
				return "/assets/cards/Blank.png";
			}
		}

		$scope.playerTurn = function() {
			return $scope.game.whosTurn();
		}


		$scope.cardSelect = function(card) {
			if ($scope.game.whosTurn() == $scope.game.players[0].name) {
				if ($scope.selectedCards($scope.cards).length < 4) {
					card.selected = true;
				}
			}
		}

		$scope.cancel = function() {
			$scope.cards.forEach(function (card) {
				card.selected = false;
			});
		}

		$scope.play = function() {
			if ($scope.selectedCards($scope.cards).length > 0) {
				$scope.result = $scope.game.whosTurn() + " played " + $scope.game.players[0].hand.selectedCards().length + " " + $scope.game.currentRank() + "'s";
				var selectedCards = $scope.selectedCards($scope.cards)
				selectedCards.forEach(function (card) {
					var cards = $scope.cards;
					card.selected = false;
					cards.splice(cards.indexOf(card), 1);
					$scope.cards = cards;
				});
				$scope.game.discardPile.recieveNewCards($scope.game.currentRank(), selectedCards);
				$scope.game.changeCurrentRank();
				if($scope.robotWaitForDoubts()) {
					$scope.robotPressIDoubtIt();
				}
				$scope.game.changeTurnOrder();

				$timeout(function() {
					$scope.robotTurn();
					$scope.checkWinCondition();
				}, 1000);

				$timeout(function() {
					$scope.game.changeTurnOrder();
					$scope.checkWinCondition();
					$scope.saveLocal();
				}, 5000);
			}
		}

		$scope.doubt = function() {
			if($scope.game.whosTurn() != $scope.game.players[0].name){
				if ($scope.game.discardPile.isDiscardPure) {
					$scope.result = "You called I doubt it and were wrong. You picked up the discard pile.";
					$scope.game.players[0].addCardsToHand($scope.game.discardPile.takeCards());
				} else {
					$scope.result = "You called I doubt it and were Right. Robot picked up the discard pile.";
					$scope.game.players[1].addCardsToHand($scope.game.discardPile.takeCards());
				}
			}
		}

		$scope.currentRank = function() {
			return $scope.game.currentRank();
		}

		$scope.results = function() {
			return $scope.result;
		}

		//All methods after this do not directly change the display. They change the game and the above methods update the view.

		$scope.checkWinCondition = function() {
			$scope.game.players.forEach(function(player) {
				if (player.handSize() <= 0) {
					$scope.result = player.name + " Won!";
				}
			});
		}

		$scope.robotTurn = function() {
			var randomIndex = 0;
			var description = '';
			var card = '';
			var cardsToPlay = new Array();
			for (var i = 0; i < 4; i++) {
				randomIndex = Math.floor(Math.random() * $scope.game.players[1].handSize());
				description = $scope.game.players[1].hand.cards[randomIndex].description();
				card = $scope.game.players[1].hand.takeCardByDescription(description);
				cardsToPlay.push(card);
			}
			$scope.game.discardPile.recieveNewCards($scope.game.currentRank, cardsToPlay);
			$scope.result = "Robot played " + cardsToPlay.length + " " + $scope.game.currentRank() + "'s";
			$scope.game.changeCurrentRank();
			// refreshHand();
		}
		
		$scope.robotWaitForDoubts = function() {
			for (var i = 0; i < 20; i++) {
				var chance = Math.floor(Math.random() * 100);
				if(chance < 5) {
					return true;
				}
			}
		}

		$scope.robotPressIDoubtIt = function() {
			if ($scope.game.discardPile.isDiscardPure) {
				$scope.result = "Robot called I doubt it and was wrong. He picked up the discard pile.";
				$scope.game.players[1].addCardsToHand($scope.game.discardPile.takeCards());
			} else {
				$scope.result = "Robot called I doubt it and was Right. You picked up the discard pile.";
				$scope.game.players[0].addCardsToHand($scope.game.discardPile.takeCards());
			}
		}
	}
}
