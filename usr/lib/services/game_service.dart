import 'package:couldai_user_app/models/player.dart';
import 'package:couldai_user_app/models/character.dart';

class GameService {
  static final GameService _instance = GameService._internal();
  factory GameService() => _instance;
  GameService._internal();

  Player? currentPlayer;

  final List<Player> _onlinePlayers = [
    Player(id: "2", name: "ShadowBlade", character: Character(name: "ShadowBlade", characterClass: CharacterClass.rogue, level: 5)),
    Player(id: "3", name: "ArcaneWeaver", character: Character(name: "ArcaneWeaver", characterClass: CharacterClass.mage, level: 7)),
    Player(id: "4", name: "IronHeart", character: Character(name: "IronHeart", characterClass: CharacterClass.warrior, level: 6)),
  ];

  void createCharacter(String name, CharacterClass characterClass) {
    final character = Character(name: name, characterClass: characterClass);
    currentPlayer = Player(id: "1", name: name, character: character);
  }

  List<Player> getOnlinePlayers() {
    return _onlinePlayers;
  }
}
