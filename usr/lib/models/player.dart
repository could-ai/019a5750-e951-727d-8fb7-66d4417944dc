import 'package:couldai_user_app/models/character.dart';

class Player {
  final String id;
  final String name;
  final Character character;

  Player({
    required this.id,
    required this.name,
    required this.character,
  });
}
