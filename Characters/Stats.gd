extends Resource
class_name CharacterStats


@export var insectType: String
@export var name: String
@export var characterColor: String
@export var health: int
@export var level: int
@export var experience: int

# To be determined Character stats like strength, agility, gathering etc


# functions for updating stats
func levelup():
    level += 1
    experience = 0
    health += 12
    # add more stats to level up here

func gainxp(xp: int):
    experience += xp
    if experience >= 110 * level:
        levelup()