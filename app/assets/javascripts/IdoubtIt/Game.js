function Game() {
  this.deck = new Deck(),
  this.discardPile = new DiscardPile(),
  this.players = new Array(),
  this.turnOrder = new Array(),
  this.ranks = this.deck.ranks,
  this.className = "Game"
}

Game.prototype.addPlayer = function(name, isrobot) {
  this.players.push(new Player(name, isrobot));
  this.turnOrder.push(new Player(name, isrobot));
}

Game.prototype.changeTurnOrder = function() {
  this.turnOrder.push(this.turnOrder.shift());
}

Game.prototype.whosTurn = function() {
  return this.turnOrder[0].name;
}

Game.prototype.playersTurn = function() {
  for (var i = 0; i < this.players.length; i++) {
    if (this.players[i].name == this.whosTurn()) {
      return this.players[i];
    }
  }
}

Game.prototype.hasRobots = function() {
  var value = false;
  for (var i = 0; i < this.players.length; i++) {
    if (this.players[i].isRobot()) {
      value =  true;
    }
  }
  return value;
}

Game.prototype.playerPosition = function(name) {
  for (var i = 0; i < this.players.length; i++) {
    if (this.players[i].name == name) {
      return this.players[i];
    }
  }
}

Game.prototype.previousPlayer = function() {
  for (var i = 0; i < this.players.length; i++) {
    if (this.players[i].name == this.turnOrder[this.turnOrder.length - 1].name) {
      return this.players[i];
    }
  }
}

Game.prototype.dealCards = function() {
  while (this.deck.size() != 0) {
    for (var j = 0; j < this.players.length; j++) {
      if (this.deck.size() != 0) {
        this.players[j].addCardsToHand([this.deck.takeTopCard()]);
      }
    }
  }
}

Game.prototype.setup = function() {
  this.deck.makeDeck();
  this.deck.shuffle();
  this.dealCards();
}

Game.prototype.currentRank = function() {
  return this.ranks[0];
}

Game.prototype.changeCurrentRank = function() {
  this.ranks.push(this.ranks.shift());
}