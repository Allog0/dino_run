import 'package:flutter/material.dart';
class GameHasOver extends StatelessWidget {

  bool gameHasOver;

  GameHasOver({required this.gameHasOver});

  @override
  Widget build(BuildContext context) {
    return gameHasOver
        ? Stack(
      children: [
        Container(
          alignment: const Alignment(0, -0.7),
          child: Text(
            'HAS PERDIDO',
            style: TextStyle(color: Colors.grey[800], fontSize: 40),
          ),
        ),
        Container(
          alignment: const Alignment(0, -0.1),
          child: Text(
            'Vuelve a dar clic para volver a jugar',
              style: TextStyle(color: Colors.grey[800], fontSize: 30)
          ),
        )
      ],
    )
        : Container();
  }
}
