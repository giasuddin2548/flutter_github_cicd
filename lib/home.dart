import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Github CI-CD")),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (c, i) => ListTile(title: Text("Itme Name $i")),
      ),
    );
  }
}
