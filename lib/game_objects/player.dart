import 'moloch_stone.dart';

class Player {
  String playerName;
  List<MolochStone> molochStones = [];

  @override
  String toString() {
    return 'Player{playerName: $playerName, molochStones: $molochStones}';
  }
}
