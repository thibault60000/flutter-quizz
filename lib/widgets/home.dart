import 'package:flutter/material.dart';
import 'package:flutter_quizz/widgets/custom_text.dart';
import 'package:flutter_quizz/widgets/page_quizz.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Card(
                elevation: 10.0,
                child: SizedBox(
                  height: MediaQuery.of(context).size.width * 0.8,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Image.asset("assets/images/cover.jpeg",
                      fit: BoxFit.contain),
                )),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PageQuizz()));
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.teal,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 20.0),
                ),
                child: const CustomText(text: 'Commencer le Quizz', size: 1.5))
          ],
        )));
  }
}
