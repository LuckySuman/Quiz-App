import 'question.dart';
import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xfff8d97b),
        appBar: AppBar(
          title: Text("Answer true or false!",
              style: TextStyle(color: Color(0xfff8d97b))),
          backgroundColor: Colors.black,
        ),
        body: QuizApp(),
      ),
    ),
  );
}

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List<Icon> icon = [];

  int quesNumber = 0;
  void correct(bool correct) {
    bool correctAnswer = getCorrectAnswer(quesNumber);
    if (isFinished() == true) {
      //show an alert using rFlutter_alert,

      Alert(
        context: context,
        title: 'Finished!',
        desc: 'You\'ve reached the end of the quiz.',
      ).show();

      //TODO Step 4 Part C - reset the questionNumber,
      reset();

      //TODO Step 4 Part D - empty out the scoreKeeper.
      icon = [];
    }

    if (correctAnswer == correct) {
      setState(() {
        icon.add(Icon(Icons.check, color: Colors.black));
        nextQuestion();
      });
    } else {
      setState(() {
        icon.add(Icon(Icons.close, color: Colors.black));
        nextQuestion();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
                  child: Center(
                      child: (Text(getQuestionText(quesNumber),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            //fontWeight: FontWeight.bold,
                          )))))),
          Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsetsDirectional.all(10),
              color: Colors.green,
              child: TextButton(
                  child: Text('True', style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    correct(true);
                  })),
          Container(
              margin: EdgeInsetsDirectional.all(10),
              padding: EdgeInsets.all(10),
              color: Colors.red,
              child: TextButton(
                  child: Text('False', style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    correct(false);
                  })),
          Row(
            children: icon,
          ),
        ]);
  }
}
