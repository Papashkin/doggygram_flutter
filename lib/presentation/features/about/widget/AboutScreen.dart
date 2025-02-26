import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("DoggyGram"))),
      body: Center(
        child: Column(
          verticalDirection: VerticalDirection.down,
          children: [
            Text("developed by Papashkin"),
            Text("v1.0.0"),
          ],
        ),
      ),
    );
  }
}
