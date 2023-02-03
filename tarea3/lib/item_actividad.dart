import 'package:flutter/material.dart';

class ItemActividad extends StatelessWidget {
  final Map<String, String> actividad;
  ItemActividad({super.key, required this.actividad});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 120,
            width: 120,
            child: Image.network(
              "${actividad["image"]}",
              fit: BoxFit.fill,
            ),
          ),
          Text("${actividad["dia"]}", style: TextStyle(fontSize: 11)),
          Text("${actividad["lugar"]}"),
        ],
      ),
    );
  }
}
