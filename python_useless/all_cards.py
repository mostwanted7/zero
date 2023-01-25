class Card:
    def __init__(self, id, name, std_action):
        self.id = id
        self.name = name
        # Per card specific action
        self.std_action = std_action
        if (id < 10):
            self.can_set = True
        else:
            self.can_set = False

''' 
Modular list of all playable cards

FORMAT:
def... # Define the function specifying what action the card does
cardname = Card(...) # Generate card object
cards.add(cardname)
'''

cards = []
#--------------------------------------------------------------------
def damage():
    pass
trap = Card(0,"Trap Hole", damage)
cards.append(trap)
#--------------------------------------------------------------------
def heal():
    pass
bead = Card(15,"Rejuvenation bead", heal)
cards.append(heal)
#--------------------------------------------------------------------


