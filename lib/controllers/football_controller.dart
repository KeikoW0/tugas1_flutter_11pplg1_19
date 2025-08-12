import 'package:get/get.dart';
import '../models/football_model.dart';

class FootballController extends GetxController {
  var players = <Player>[
    Player(
      profileImage: "assets/images/avatar_1.png",
      name: "Player A",
      position: "Striker",
      number: 3,
    ),
    Player(
      profileImage: "assets/images/avatar_2.png",
      name: "Player B",
      position: "Midfielder",
      number: 7,
    ),
    Player(
      profileImage: "assets/images/avatar_3.png",
      name: "Player C",
      position: "Goalkeeper",
      number: 9,
    ),
  ].obs;

  void updatePlayer(int index, Player newPlayer) {
    players[index] = newPlayer;
  }
}
