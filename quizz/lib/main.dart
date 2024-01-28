import 'package:flutter/material.dart';
import 'quizbrain.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [
    // const Icon(Icons.check, color: Colors.green),
    // const Icon(Icons.close, color: Colors.red),
  ];
  // List<String> questions = [
  //   'You can lead a cow down stairs but not up stairs.',
  //   'Approximately one quarter of human bones are in the feet.',
  //   'A slug\'s blood is green.',
  // ];
  // List<bool> answers = [false, true, true];
  // Question q1 = Question (q: 'You can lead a cow down stairs but not up stairs.', a: false);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(questionNumber),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              bool correctAnswer = quizBrain.getCorrectAnswer(questionNumber);
              if (correctAnswer == true) {
                print('user got it right');
              } else {
                print('user got it wrong');
              }
              setState(
                () {
                  // scoreKeeper.add(
                  //   const Icon(Icons.check,
                  //       color: Color.fromARGB(255, 0, 181, 39)),
                  // );

                  //questionNumber++;
                  quizBrain.nextQuestion();
                },
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 0, 209, 73)),
              foregroundColor: MaterialStateProperty.all(Colors.white),
            ),
            child: const Text('True'),
          ),
        ),
        const SizedBox(height: 10.0),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              bool correctAnswer = quizBrain.getCorrectAnswer(questionNumber);
              if (correctAnswer == true) {
                print('user got it right');
              } else {
                print('user got it wrong');
              }
              setState(
                () {
                  // scoreKeeper.add(
                  //   const Icon(Icons.check,
                  //       color: Color.fromARGB(255, 0, 181, 39)),
                  // );

                  //questionNumber++;
                  quizBrain.nextQuestion();
                },
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
              foregroundColor: MaterialStateProperty.all(Colors.white),
            ),
            child: const Text('False'),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
