import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'Dificultad.dart';
import 'home.dart';
import 'palette.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainMenu2 extends StatelessWidget{

  double dificultad = 0;


  @override
  Widget build(BuildContext context){

    //final palette = context.watch<Palette>();

    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 40, 0, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text('Dino Run',
                      style: TextStyle(
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                          fontSize: 36,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 0.7
                            ..color = Colors.white
                      ),),
                    const Text('En Flutter',
                      style: TextStyle(
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                        fontSize: 36,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FilledButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Home(dificultad: dificultad,)),
                          );
                        },
                        child: const Text('Play')
                ),
                    SizedBox(height: 16),
                    FilledButton(
                      onPressed: ()
                      {Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Dificultad(dificultad: dificultad,)),
                      );},
                      child: const Text('Dificultad'),
                    ),
              ],
            ),
        ]
          )
      ),
    )
    );
  }
}