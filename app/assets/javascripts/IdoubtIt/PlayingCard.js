function PlayingCard(rank, suit) {
  this.rank = rank,
  this.suit = suit,
  this._rankOrder = ["Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King"],
  this.selected = false,
  this.value = this._rankOrder.indexOf(this.rank),
  this.className = "PlayingCard"
}

PlayingCard.prototype.description = function() {
  return this.rank + " of " + this.suit;
}

PlayingCard.prototype.class = function() {
  return "card_" + this.rank + "_of_" + this.suit;
}