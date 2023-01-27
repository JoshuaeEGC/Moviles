import 'package:flutter/material.dart';

class mc_flutter extends StatefulWidget {
  mc_flutter({
    Key? key,
  }) : super(key: key);

  @override
  State<mc_flutter> createState() => _mc_flutterState();
}

class _mc_flutterState extends State<mc_flutter> {
  int presionado = 1;
  int presionado1 = 1;
  int presionado2 = 1;
  int presionado3 = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mc Flutter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 140,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Icon(
                          Icons.account_circle,
                          size: 50,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Flutter McFlutter",
                              style: TextStyle(fontSize: 25),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Experienced app developer",
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "123 Main Street",
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      "(415)555-0198",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        presionado++;
                        setState(() {});
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(SnackBar(
                            content: Text("Calculando ruta..."),
                          ));
                      },
                      icon: Icon(
                        Icons.accessibility,
                        color:
                            presionado % 2 == 0 ? Colors.indigo : Colors.grey,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        presionado1++;
                        setState(() {});
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(SnackBar(
                            content: Text("Llamando..."),
                          ));
                      },
                      icon: Icon(
                        Icons.phone_android,
                        color:
                            presionado1 % 2 == 0 ? Colors.indigo : Colors.grey,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        presionado2++;
                        setState(() {});
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(SnackBar(
                            content: Text("Llamando..."),
                          ));
                      },
                      icon: Icon(
                        Icons.phone_iphone,
                        color:
                            presionado2 % 2 == 0 ? Colors.indigo : Colors.grey,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        presionado3++;
                        setState(() {});
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(SnackBar(
                            content: Text("Mensaje..."),
                          ));
                      },
                      icon: Icon(
                        Icons.alarm,
                        color:
                            presionado3 % 2 == 0 ? Colors.indigo : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
