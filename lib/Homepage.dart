import 'package:flutter/material.dart';
import 'chatscreen.dart';


class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:new AppBar(
        title: new Text("Frendzy Chat"),
      ),
      body:new Chatscreen(),
    );
  }
}
