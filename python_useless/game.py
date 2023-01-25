from all_cards import cards

class Player:
    def __init__(self):
        self.hand = cards
        self.board = []

    def show_board(self):
        return self.board

game_over = False
player1 = Player()
player2 = Player()

# Main game loop for a turn based game
while game_over == False:
    player1.turn()
    player2.turn()

