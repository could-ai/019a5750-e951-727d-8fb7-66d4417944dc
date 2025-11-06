import 'package:flutter/material.dart';
import 'package:couldai_user_app/models/character.dart';
import 'package:couldai_user_app/services/game_service.dart';

class CharacterCreationScreen extends StatefulWidget {
  const CharacterCreationScreen({super.key});

  @override
  State<CharacterCreationScreen> createState() => _CharacterCreationScreenState();
}

class _CharacterCreationScreenState extends State<CharacterCreationScreen> {
  final _nameController = TextEditingController();
  CharacterClass _selectedClass = CharacterClass.warrior;
  final GameService _gameService = GameService();

  void _createCharacter() {
    if (_nameController.text.isNotEmpty) {
      _gameService.createCharacter(_nameController.text, _selectedClass);
      Navigator.pushReplacementNamed(context, '/game');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a character name.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Your Hero'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Character Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<CharacterClass>(
              value: _selectedClass,
              onChanged: (CharacterClass? newValue) {
                if (newValue != null) {
                  setState(() {
                    _selectedClass = newValue;
                  });
                }
              },
              items: CharacterClass.values.map((CharacterClass charClass) {
                return DropdownMenuItem<CharacterClass>(
                  value: charClass,
                  child: Text(charClass.toString().split('.').last.toUpperCase()),
                );
              }).toList(),
              decoration: const InputDecoration(
                labelText: 'Class',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: _createCharacter,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text('Create Character'),
            ),
          ],
        ),
      ),
    );
  }
}
