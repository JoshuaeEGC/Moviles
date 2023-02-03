import 'package:flutter/material.dart';

class pantalla extends StatefulWidget {
  pantalla({
    super.key,
  });

  @override
  State<pantalla> createState() => _pantallaState();
}

class _pantallaState extends State<pantalla> {
  int like = 0;
  int food = 1;
  int info = 1;
  int gps = 1;
  bool tap = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenidos al ITESO'),
      ),
      body: ListView(
        children: [
          Image.network(
              "https://cruce.iteso.mx/wp-content/uploads/sites/123/2018/04/Portada-2-e1525031912445.jpg"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                "EL ITESO, Universidad Jesuita de Guadalajara",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              subtitle: Text("Periferico Sur 8585"),
              trailing: IconButton(
                color: tap ? Colors.indigo : Colors.black54,
                onPressed: () {
                  like++;
                  tap = !tap;
                  setState(() {});
                },
                icon: Icon(Icons.thumb_up_alt),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        food++;
                        setState(() {});
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            SnackBar(
                              content: Text(
                                  "Puedes encontrar comida en sus cafeterías"),
                            ),
                          );
                      },
                      icon: Icon(
                        Icons.fastfood,
                        size: 35,
                        color: food % 2 == 0 ? Colors.indigo : Colors.black,
                      ),
                    ),
                    Text("Comida"),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        info++;
                        setState(() {});
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            SnackBar(
                              content:
                                  Text("Puedes pedir información en rectoría"),
                            ),
                          );
                      },
                      icon: Icon(
                        Icons.info,
                        size: 35,
                        color: info % 2 == 0 ? Colors.indigo : Colors.black,
                      ),
                    ),
                    Text("Informacion"),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        gps++;
                        setState(() {});
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            SnackBar(
                              content: Text(
                                  "Se encuentra ubicado en Periférico Sur 8585"),
                            ),
                          );
                      },
                      icon: Icon(
                        Icons.gps_fixed,
                        size: 35,
                        color: gps % 2 == 0 ? Colors.indigo : Colors.black,
                      ),
                    ),
                    Text(
                      'Ruta',
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Text(
                "El ITESO, Universidad Jesuita de Guadalajara (Instituto Tecnológico y de Estudios Superiores de Occidente), es una universidad privada ubicada en la Zona Metropolitana de Guadalajara, Jalisco, México, fundada en el año 1957.",
                textAlign: TextAlign.justify),
          ),
        ],
      ),
    );
  }
}
