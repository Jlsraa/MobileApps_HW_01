// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tarea 01',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int likes = 0;
  bool hasBeenPressedUp = false;
  bool hasBeenPressedDown = false;
  bool emailClick = false;
  bool callClick = false;
  bool addressClick = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.network(
              "https://iteso.mx/image/journal/article?img_id=16128044&t=1558394499096"),
          /***************************** ROW 1 ***********************************/
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "ITESO, Universidad Jesuita de Guadalajara",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Text(
                      "San Pedro Tlaquepaque, Jal.",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                    )
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        color: hasBeenPressedUp ? Colors.blue : Colors.black,
                        onPressed: () {
                          likes++;
                          setState(() {
                            hasBeenPressedUp = !hasBeenPressedUp;
                            hasBeenPressedDown = false;
                          });
                        },
                        icon: Icon(Icons.thumb_up)),
                    IconButton(
                        color: hasBeenPressedDown ? Colors.red : Colors.black,
                        onPressed: () {
                          if (likes > 0) likes--;
                          setState(() {
                            hasBeenPressedDown = !hasBeenPressedDown;
                            hasBeenPressedUp = false;
                          });
                        },
                        icon: Icon(Icons.thumb_down)),
                    Text("$likes"),
                  ],
                ),
              ],
            ),
          ),
          /***************************** ROW 2 ***********************************/
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  IconButton(
                      iconSize: 50,
                      color: emailClick ? Colors.blue : Colors.black,
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            SnackBar(
                              content: Text("Correo del ITESO: dse@iteso.mx"),
                            ),
                          );
                        setState(() {
                          if (addressClick == true || callClick == true) {
                            addressClick = false;
                            callClick = false;
                          }
                          emailClick = !emailClick;
                        });
                      },
                      icon: Icon(Icons.email)),
                  Text("Correo", style: TextStyle(fontWeight: FontWeight.bold))
                ],
              ),
              Column(
                children: [
                  IconButton(
                      iconSize: 50,
                      color: callClick ? Colors.blue : Colors.black,
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            SnackBar(
                              content: Text("Llamar a ITESO: (33) 3669 3434"),
                            ),
                          );
                        setState(() {
                          if (addressClick == true || emailClick == true) {
                            addressClick = false;
                            emailClick = false;
                          }
                          callClick = !callClick;
                        });
                      },
                      icon: Icon(Icons.call)),
                  Text("Llamar", style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              Column(
                children: [
                  IconButton(
                      iconSize: 50,
                      color: addressClick ? Colors.blue : Colors.black,
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            SnackBar(
                              content: Text(
                                  "Ir a ITESO: Periférico Sur Manuel Gómez Morín # 8585 C.P. 45604 Tlaquepaque, Jalisco, México"),
                            ),
                          );
                        setState(() {
                          if (callClick == true || emailClick == true) {
                            callClick = false;
                            emailClick = false;
                          }
                          addressClick = !addressClick;
                        });
                      },
                      icon: Icon(Icons.directions)),
                  Text("Dirección",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              )
            ],
          ),
          /***************************** ROW 3 ***********************************/
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Text(
              "El ITESO es la Universidad Jesuita de Guadalajara. Fue fundado en 1957 y pertenece al conjunto de más de 228 universidades jesuitas en el mundo. Comparte con ellas la tradición educativa de 450 años, históricamente ubicada en el centro del pensamiento mundial y reconocida por la formación de líderes en todos los campos de las ciencias y las artes.",
              textAlign: TextAlign.justify,
            ),
          )
        ],
      ),
    );
  }
}
