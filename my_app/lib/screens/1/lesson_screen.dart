// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_final_fields, prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:my_app/screens/2/course_screen_phy2.dart';
import 'package:my_app/screens/1/myhomepage.dart';

class LessonScreen extends StatefulWidget {
  @override
  _PhysicsElectrical2 createState() => _PhysicsElectrical2();
}

class _PhysicsElectrical2 extends State<LessonScreen> {
  int _currentIndex = 0;
  int _correctAnswers = 0;
  List<Map<String, dynamic>> _questions = [
    {
      'question': 'What is Ohm\'s Law?',
      'options': [
        'V = IR',
        'P = IV',
        'V = I^2R',
        'I = V/R',
      ],
      'correctIndex': 0,
    },
    {
      'question': 'What is the SI unit of resistance?',
      'options': [
        'Volt',
        'Watt',
        'Ampere',
        'Ohm',
      ],
      'correctIndex': 3,
    },
    {
      'question':
          'Which of the following materials has the highest resistivity?',
      'options': [
        'Copper',
        'Silver',
        'Aluminum',
        'Nichrome',
      ],
      'correctIndex': 3,
    },
    {
      'question':
          'What happens to the resistance of a conductor if its length is doubled?',
      'options': [
        'Doubles',
        'Halves',
        'Remains the same',
        'Becomes zero',
      ],
      'correctIndex': 0,
    },
    {
      'question':
          'Which of the following circuits has the same current flowing through all its components?',
      'options': [
        'Series circuit',
        'Parallel circuit',
        'Combination circuit',
        'Open circuit',
      ],
      'correctIndex': 0,
    },
    // Add more questions here...
  ];

  void _answerQuestion(int selectedOptionIndex) {
    final bool isCorrect =
        selectedOptionIndex == _questions[_currentIndex]['correctIndex'];
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            isCorrect ? 'Correct!' : 'Wrong!',
            style: TextStyle(color: isCorrect ? Colors.green : Colors.red),
          ),
          content: Text(
            isCorrect
                ? 'Well done!'
                : 'The correct answer is: ${_questions[_currentIndex]['options'][_questions[_currentIndex]['correctIndex']]}',
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  if (isCorrect) {
                    _correctAnswers++;
                  }
                  if (_currentIndex < _questions.length - 1) {
                    _currentIndex++;
                  } else {
                    _showResult();
                  }
                });
              },
              child: Text('Next'),
            ),
          ],
        );
      },
    );
  }

  void _showResult() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            'Quiz Completed',
            style: TextStyle(color: Colors.orange),
          ),
          content: Text(
              'You answered $_correctAnswers out of ${_questions.length} questions correctly.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CourseScreenPHY2(
                            courseTitle: 'physics course',
                          )),
                  (Route<dynamic> route) => false,
                );
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Physics Electrical 1 Quiz',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Question ${_currentIndex + 1}/${_questions.length}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            SizedBox(height: 10),
            Text(
              _questions[_currentIndex]['question'],
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: List.generate(
                _questions[_currentIndex]['options'].length,
                (index) => ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.orange),
                  ),
                  onPressed: () => _answerQuestion(index),
                  child: Text(
                    _questions[_currentIndex]['options'][index],
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MyHomePage(
      title: 'home page',
    ), // Set the actual home screen here
  ));
}
