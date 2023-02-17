import 'dart:convert';
import 'package:flutter/material.dart';
import 'data/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var exchanges = jsonDecode(CRYPTO_EXCHANGES) as List;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crypto APP"),
      ),
      body: ListView.separated(
        itemCount: exchanges.length,
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Image.network(
              "${exchanges[index]["image"]}",
              height: 40,
            ),
            title: Text("${exchanges[index]["name"]}"),
            subtitle: Text(
                "${exchanges[index]["country"]} \n ${exchanges[index]["year_established"]}"),
            trailing: CircleAvatar(
              backgroundColor: Colors.black,
              child: Text("${exchanges[index]["trust_score"]}"),
            ),
          );
        },
      ),
    );
  }
}
