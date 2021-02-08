import 'package:flutter/material.dart';
import 'package:quizApp/model/question.dart';

class Questions extends StatefulWidget {
  @override
  _QuestionsState createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  int _currentQuestionIndex = 0;
  List questionBank = [
    Question.name("Modi is the President of Pakistan", false),
    Question.name("Imran Khan is the President of Pakistan", true),
    Question.name("Prophet Hazrat Muhammad is the last messenger", true),
    Question.name("Eid-ul-fitar is the festival of hindu", false),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "True Citizen",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.blueGrey,
      body: Builder(
        builder: (BuildContext context) => Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  "assets/images/flag.png",
                  width: 250,
                  height: 180,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(14.4),
                    border: Border.all(
                      color: Colors.blueGrey.shade400,
                      style: BorderStyle.solid,
                    ),
                  ),
                  height: 120,
                  child: Center(
                    child: Text(
                      questionBank[_currentQuestionIndex].questionText,
                      style: TextStyle(
                        fontSize: 16.9,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    onPressed: () => _previousQuestion(),
                    color: Colors.blueGrey.shade900,
                    child: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  RaisedButton(
                    onPressed: () => _checkAnswer(true, context),
                    color: Colors.blueGrey.shade900,
                    child: Text(
                      "TRUE",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => _checkAnswer(false, context),
                    color: Colors.blueGrey.shade900,
                    child: Text(
                      "False",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => _nextQuestion(),
                    color: Colors.blueGrey.shade900,
                    child: Icon(Icons.arrow_forward, color: Colors.white),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  _checkAnswer(bool userChoice, BuildContext context) {
    if (userChoice == questionBank[_currentQuestionIndex].isCorrect) {
      final snackBar = SnackBar(
        content: Text("Correct"),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.green,
      );
      Scaffold.of(context).showSnackBar(snackBar);
      _updateQuestion();
    } else {
      final snackBar = SnackBar(
        content: Text("Incorrect"),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
      );
      Scaffold.of(context).showSnackBar(snackBar);
      _updateQuestion();
    }
  }

  _updateQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
    });
  }

  _nextQuestion() {
    _updateQuestion();
  }

  _previousQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex - 1) % questionBank.length;
    });
  }
}
