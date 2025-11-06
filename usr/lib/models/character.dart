enum CharacterClass {
  warrior,
  mage,
  rogue,
}

class Character {
  final String name;
  final CharacterClass characterClass;
  final int level;
  final int health;
  final int mana;

  Character({
    required this.name,
    required this.characterClass,
    this.level = 1,
    this.health = 100,
    this.mana = 50,
  });

  String get className {
    switch (characterClass) {
      case CharacterClass.warrior:
        return "Warrior";
      case CharacterClass.mage:
        return "Mage";
      case CharacterClass.rogue:
        return "Rogue";
    }
  }
}
