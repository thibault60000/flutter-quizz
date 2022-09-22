import 'package:flutter/material.dart';
import 'package:flutter_quizz/widgets/custom_text.dart';
import 'package:flutter_quizz/models/question.dart';

class PageQuizz extends StatefulWidget {
  const PageQuizz({super.key});

  @override
  State<PageQuizz> createState() => _PageQuizzState();
}

class _PageQuizzState extends State<PageQuizz> {
  late Question question;

  List<Question> questionsList = [
    Question(
        "Le roi est il la pièce à protéger dans un jeu d'échec ?",
        true,
        "Oui il s'agit bien du Roi",
        "https://le-palais-des-echecs.com/wp-content/uploads/2021/07/240090379_images_19497116629.jpg"),
    Question(
        "La capitale de l'Australie est Sidney ? ",
        false,
        "Il s'agit de Canberra",
        "https://www.ou-et-quand.net/partir/images/illustration/australie_498.jpg")
  ];

  int index = 0;
  int score = 0;

  @override
  void initState() {
    super.initState();
    question = questionsList[index];
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width * 0.75;

    return Scaffold(
        appBar: AppBar(title: const CustomText(text: 'Quizz', size: 1.5)),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomText(
                  text: "Question n°${index + 1}",
                  size: 1.5,
                  color: Colors.black),
              CustomText(
                  text: "Score: $score / $index",
                  size: 1.5,
                  color: Colors.black),
              Card(
                  elevation: 10.0,
                  child: SizedBox(
                    height: size,
                    width: size,
                    child: Image.network(question.image, fit: BoxFit.contain),
                  )),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: CustomText(
                      text: question.question,
                      size: 1.5,
                      color: Colors.grey,
                      textAlign: TextAlign.center)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [choiceButton(true), choiceButton(false)],
              )
            ],
          ),
        ));
  }

  Future openDialog(bool b) async {
    bool response = (b == question.response);

    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => SimpleDialog(
        title: CustomText(
          text: response ? "Bravo" : "Dommage",
          size: 1.5,
          color: response ? Colors.green : Colors.red,
          textAlign: TextAlign.center,
        ),
        contentPadding: const EdgeInsets.all(20.0),
        children: [
          Image.network(
              response
                  ? "https://media.giphy.com/media/ytTYwIlbD1FBu/giphy.gif"
                  : "https://media.giphy.com/media/42OlQ8uMzXFCoTLUuP/giphy.gif",
              fit: BoxFit.contain),
          Container(height: 25.0),
          CustomText(
              text: response ? question.description : question.description,
              size: 1.5,
              color: Colors.black,
              textAlign: TextAlign.center),
          const SizedBox(height: 20.0),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                nextquestion();
              },
              child: const CustomText(
                text: "Suivant",
                size: 1.5,
              ))
        ],
      ),
    );
  }

  Future<Null> alert() async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => SimpleDialog(
        title: const CustomText(
          text: "Fin du quizz",
          size: 1.5,
          color: Colors.black,
          textAlign: TextAlign.center,
        ),
        contentPadding: const EdgeInsets.all(20.0),
        children: [
          Image.network(
              "https://media.giphy.com/media/WoddXx7YtZeCqUD2tV/giphy.gif",
              fit: BoxFit.contain),
          Container(height: 25.0),
          CustomText(
              text: "Votre score est de $score / $index",
              size: 1.5,
              color: Colors.black,
              textAlign: TextAlign.center),
          const SizedBox(height: 20.0),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const CustomText(
                text: "Retour",
                size: 1.5,
              ))
        ],
      ),
    );
  }

  void nextquestion() {
    if (index < questionsList.length - 1) {
      setState(() {
        index++;
        question = questionsList[index];
      });
    } else {
      alert();
      setState(() {
        index = 0;
        score = 0;
        question = questionsList[index];
      });
    }
  }

  ElevatedButton choiceButton(bool b) {
    return ElevatedButton(
        onPressed: () {
          if (b == question.response) {
            score++;
          }
          openDialog(b);
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.teal,
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        ),
        child: CustomText(text: b ? "Vrai" : "Faux", size: 1.5));
  }
}
