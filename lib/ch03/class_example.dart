void main() {
  Game game1 = Game('Start Craft', 'Strategy');
  Game game2 = ArcadeGame('Strike 1945', 'Shooting', true);

  print('game1 is ${game1.name}');
  print('game2 is ${game2.name}');

  game1.genre = 'Realtime Strategy';

  game1.play();
  game2.play();
}

class Game {
  String _name;
  String _genre;

  Game(this._name, this._genre);

  String get name => _name;
  set genre(g) => _genre = g;

  void play() {
    print('play $_name game($_genre)!!');
  }
}

class ArcadeGame extends Game {
  bool _joystickSupport = false;

  ArcadeGame(String name, String genre, this._joystickSupport): super(name, genre);

  @override
  void play() {
    print('$name supports joystick? $_joystickSupport');
  }
}