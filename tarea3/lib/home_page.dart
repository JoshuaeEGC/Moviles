import 'package:flutter/material.dart';
import 'package:info_lugar/info_lugar.dart';
import 'package:info_lugar/item_actividad.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> _listElements = [
    {
      "dia": "Dia 1",
      "lugar": "Ubud",
      "image":
          "https://www.viajeroscallejeros.com/wp-content/uploads/2017/10/interior-palacio-ubud.jpg",
    },
    {
      "dia": "Dia 2",
      "lugar": "Canggu",
      "image":
          "https://a.cdn-hotels.com/gdcs/production75/d966/8994658f-13ad-4106-bde4-856450359f47.jpg?impolicy=fcrop&w=1600&h=1066&q=medium",
    },
    {
      "dia": "Dia 3",
      "lugar": "Penida Island",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/15/f5/3e/e5/nusa-penida-island.jpg?w=1400&h=-1&s=1",
    },
    {
      "dia": "Dia 4",
      "lugar": "Kuta",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbGac20Bkb1PzS6SVOIx00Kh3RdNpmab7sOdhJLHjT-NRCgXI7lT_o8sdB5g&s=8",
    },
    {
      "dia": "Dia 5",
      "lugar": "Denpasar",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3x7bHGKIWnnxyiXshJjiSDZi4eaAACqgnS5hTy3N3ojmaHBlDfzQSH03HyA&s=8",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reserva tu hotel'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  height: 180,
                  width: 390,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      'https://deih43ym53wif.cloudfront.net/bali-indonesia-shutterstock_459773704_0dd494ecf7.jpeg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              // para poder poner column o listview en stack hay que encerrarlas en positioned y anclarla a todos lados
              Positioned(
                top: 64,
                bottom: 0,
                left: 0,
                right: 0,
                child: ListView(
                  children: [
                    InfoLugar(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Details"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.grey[200],
                          ),
                        ),
                        Text("Walkthrough Flight Detail"),
                      ],
                    ),
                    Container(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _listElements.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ItemActividad(actividad: _listElements[index]);
                        },
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        setState(() {});
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            SnackBar(
                              content: Text("“Reservación en progreso"),
                            ),
                          );
                      },
                      child: Text(
                        "Start booking",
                        style: TextStyle(color: Colors.grey[200]),
                      ),
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
