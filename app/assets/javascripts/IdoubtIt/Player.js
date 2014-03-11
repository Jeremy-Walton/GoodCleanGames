function Player(name, isrobot) {
  this.name = name,
  this.isrobot = isrobot,
  this.hand = new Hand(),
  this.className = "Player"
}

Player.prototype.handSize = function() {
  return this.hand.size();
}

Player.prototype.addCardsToHand = function(cards) {
  this.hand.addCards(cards);
}

Player.prototype.takeCardsFromHand = function(newCards) {
  return this.hand.takeCards(newCards);
}

Player.prototype.isRobot = function() {
  return this.isrobot;
}

Player.prototype.playerName = function() {
  return this.name;
}