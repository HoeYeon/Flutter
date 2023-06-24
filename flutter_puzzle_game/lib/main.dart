import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(WordQuizApp());
}

class WordQuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Word Quiz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WordQuizPage(),
    );
  }
}

class WordQuizPage extends StatefulWidget {
  @override
  _WordQuizPageState createState() => _WordQuizPageState();
}

class _WordQuizPageState extends State<WordQuizPage> {
  final List<String> _words = [
    'Apple',
    'Banana',
    'Carrot',
    'Dog',
    'Elephant',
    'Fish',
    'Giraffe',
    'Horse'
  ];

  final Map<String, String> _wordTranslations = {
    'Apple': '사과',
    'Banana': '바나나',
    'Carrot': '당근',
    'Dog': '개',
    'Elephant': '코끼리',
    'Fish': '물고기',
    'Giraffe': '기린',
    'Horse': '말'
  };

  String _currentWord = '';
  List<String?> _currentOptions = [];
  String _correctTranslation = '';
  int _score = 0;
  bool _quizFinished = false;

  @override
  void initState() {
    super.initState();
    _generateQuiz();
  }

  void _generateQuiz() {
    final random = Random();
    final wordIndex = random.nextInt(_words.length);
    final word = _words[wordIndex];
    final correctTranslation = _wordTranslations[word]!;
    final options = [_wordTranslations[word]];

    while (options.length < 4) {
      final randomIndex = random.nextInt(_words.length);
      final randomWord = _words[randomIndex];
      final translation = _wordTranslations[randomWord]!;
      if (!options.contains(translation)) {
        options.add(translation);
      }
    }

    options.shuffle();

    setState(() {
      _currentWord = word;
      _currentOptions = options;
      _correctTranslation = correctTranslation;
    });
  }

  void _checkAnswer(String answer) {
    if (!_quizFinished) {
      if (answer == _correctTranslation) {
        setState(() {
          _score++;
        });
      }
      _generateQuiz();
    }
  }

  void _finishQuiz() {
    setState(() {
      _quizFinished = true;
    });
  }

  void _restartQuiz() {
    setState(() {
      _score = 0;
      _quizFinished = false;
    });
    _generateQuiz();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Word Quiz'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Translate the word:',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 20),
          Text(
            _currentWord,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          if (!_quizFinished)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _currentOptions
                  .map(
                    (option) => Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: ElevatedButton(
                        child: Text(option!),
                        onPressed: () => _checkAnswer(option),
                      ),
                    ),
                  )
                  .toList(),
            ),
          if (!_quizFinished)
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: ElevatedButton(
                child: Text('Finish Quiz'),
                onPressed: _finishQuiz,
              ),
            ),
          if (_quizFinished)
            Column(
              children: [
                Text(
                  'Quiz Finished!',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 10),
                Text(
                  'Your Score: $_score / ${_words.length}',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  child: Text('Restart'),
                  onPressed: _restartQuiz,
                ),
              ],
            ),
          SizedBox(height: 20),
          Text(
            'Score: $_score',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
