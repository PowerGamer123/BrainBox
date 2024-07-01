// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_final_fields, prefer_const_constructors, unnecessary_string_interpolations

import 'package:flutter/material.dart';

class RecapScreen extends StatefulWidget {
  @override
  _RecapScreenState createState() => _RecapScreenState();
}

class _RecapScreenState extends State<RecapScreen> {
  // Total number of questions in the test
  final int totalQuestions = 5;

  // Mock score for demonstration
  int score = 3; // Set the score to 3 for demonstration

  // List of questions
  final List<String> questions = [
    'What is the force acting on an object with a mass of 5 kg and an acceleration of 10 m/s^2?',
    'Which of the following is a unit of power?',
    'What happens to the velocity of an object in motion if the net force acting on it is zero?',
    'What is the SI unit of energy?',
    'Which of the following is an example of kinetic energy?'
  ];

  // Mock user answers
  final List<String> userAnswers = [
    'A - 50 Newtons',
    'B - Volt',
    'C - The Object Will Move At A Constant Velocity',
    'B - Joule',
    'A - Stationary Rock'
  ];

  // Mock correct answers
  final List<String> correctAnswers = [
    'A - 50 Newtons',
    'E - Watt',
    'C - The Object Will Move At A Constant Velocity',
    'B - Joule',
    'D - Moving Car'
  ];

  // State to keep track of which panel is expanded
  List<bool> _isExpanded = List.filled(5, false);

  @override
  void initState() {
    super.initState();
    _calculateScore();
  }

  void _calculateScore() {
    // Calculate the score based on correct answers
    int correctCount = 0;
    for (int i = 0; i < totalQuestions; i++) {
      if (userAnswers[i] == correctAnswers[i]) {
        correctCount++;
      }
    }
    // Update the score state
    setState(() {
      score = correctCount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recap'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display score
            _buildScoreWidget(score, totalQuestions),
            SizedBox(height: 20.0),
            Text(
              'Mechanics 1 Recap',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            // Create list of questions
            Expanded(
              child: _buildQuestionList(),
            ),
          ],
        ),
      ),
    );
  }

  // Widget to display the score
  Widget _buildScoreWidget(int score, int totalQuestions) {
    // Calculate the formatted score string
    String scoreText = '$score out of $totalQuestions';
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Text(
            'Score: $scoreText',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  // Widget to build list of questions
  Widget _buildQuestionList() {
    return ListView.builder(
      itemCount: totalQuestions,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align column to the start (left)
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero, // Remove padding to align left
              title: Text('Question ${index + 1}',
                  textAlign: TextAlign.left), // Align text to the left
              trailing: Icon(
                _isExpanded[index] ? Icons.expand_less : Icons.expand_more,
              ),
              onTap: () {
                setState(() {
                  _isExpanded[index] = !_isExpanded[index];
                });
              },
            ),
            if (_isExpanded[index])
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment
                      .start, // Align column to the start (left)
                  children: [
                    Text(
                      '${questions[index]}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Your Answer: ${userAnswers[index]}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: userAnswers[index] == correctAnswers[index]
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Correct Answer: ${correctAnswers[index]}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(height: 10.0),
                  ],
                ),
              ),
            Divider(),
          ],
        );
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: RecapScreen(),
  ));
}
