import 'package:dino_run/MainMenu2.dart';
import 'package:dino_run/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'palette.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Dificultad extends StatelessWidget{

  double dificultad;

  Dificultad({
    required this.dificultad,
  });

  @override
  Widget build(BuildContext context) {

    //final palette = context.watch<Palette>();

    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: Text('Selecciona la Dificultad'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                dificultad = 0;
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home(dificultad: dificultad,)),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(FontAwesomeIcons.faceSmileBeam), // Icono al lado del texto
                  SizedBox(width: 8), // Espacio entre el icono y el texto
                  Text('Fácil'),
                ],
              ),
            ),
            SizedBox(height: 16), // Separación entre botones
            ElevatedButton(
              onPressed: () {
                dificultad = 0.005;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home(dificultad: dificultad,)),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(FontAwesomeIcons.faceFlushed),
                  SizedBox(width: 8),
                  Text('Intermedio'),
                ],
              ),
            ),
            SizedBox(height: 16), // Separación entre botones
            ElevatedButton(
              onPressed: () {
                dificultad = 0.01;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home(dificultad: dificultad,)),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(FontAwesomeIcons.faceTired),
                  SizedBox(width: 8),
                  Text('Difícil'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}