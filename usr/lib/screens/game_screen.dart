import 'package:flutter/material.dart';
import 'package:couldai_user_app/services/game_service.dart';
import 'package:couldai_user_app/models/player.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final GameService _gameService = GameService();
  Player? _currentPlayer;
  List<Player> _otherPlayers = [];

  @override
  void initState() {
    super.initState();
    _loadGameData();
  }

  void _loadGameData() {
    setState(() {
      _currentPlayer = _gameService.currentPlayer;
      _otherPlayers = _gameService.getOnlinePlayers();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_currentPlayer == null) {
      return const Scaffold(
        body: Center(
          child: Text('Error: No character found.'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, ${_currentPlayer!.character.name}'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPlayerStatsCard(),
            const SizedBox(height: 30),
            Text('Players Online', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 10),
            Expanded(
              child: _buildPlayerList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayerStatsCard() {
    final character = _currentPlayer!.character;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(character.name, style: Theme.of(context).textTheme.headlineMedium),
            Text('Level ${character.level} ${character.className}', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Health: ${character.health}'),
                Text('Mana: ${character.mana}'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayerList() {
    if (_otherPlayers.isEmpty) {
      return const Center(child: Text('No other players online.'));
    }

    return ListView.builder(
      itemCount: _otherPlayers.length,
      itemBuilder: (context, index) {
        final player = _otherPlayers[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 4.0),
          child: ListTile(
            leading: const Icon(Icons.person),
            title: Text(player.character.name),
            subtitle: Text('Level ${player.character.level} ${player.character.className}'),
          ),
        );
      },
    );
  }
}
