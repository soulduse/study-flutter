import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Dave',
      home: RandomWords()
    );
  }

}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold( // 앞으로 많이 볼듯하다. 머트리얼 라이브러리중 일부이며, appbar, title, body 속성을 기본으로 제공한다.
      appBar: AppBar(
        title: Text("Startup Name Dave"),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          // 늘어나는 index 값에서 /2를 해서 나온 정수를 리턴. 원래라면 0, 1, 1, 2, 2, 3, 3 .. 이겠지만
          // 위에 isOdd가 있으니 0, 1, 2, 3, 4 .. 순으로 증가한다.
          final index = i ~/ 2;
          if (index >= _suggestions.length) { // 첨에는 무조건 index가 크니 10개를 넣고 시작하겠군!
            _suggestions.addAll(generateWordPairs().take(10)); // 10개씩 generate 해서 넣어주는 구나
          }
          return _buildRow(_suggestions[index]); // 마지막엔 그려준다. 안드로이드 커스텀뷰 느낌이네 ListView를 Build하고, 그 내용을 채운다.
        });
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RandomWordsState(); // => createState() { return RandomWordsState(); } 을 저렇게 표현가능!
}
