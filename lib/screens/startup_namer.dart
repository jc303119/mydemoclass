import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class Namer extends StatefulWidget {
  @override
  _NamerState createState() => _NamerState();
}

class _NamerState extends State<Namer> {
  List<dynamic> _words = <WordPair>[];
  final _wordPair = WordPair.random();

  Widget  _buildRow(WordPair pair) {
    print('Build Row is called');
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                    itemCount: _words.length,
                    itemBuilder: (ctx, index) {
                      if(index.isOdd)
                        return Divider();
                      final i = index / 2;
                      if(i>= _words.length){
                        _words.addAll(generateWordPairs().take(5));
                      }
                      return _buildRow(_words[index]);
                    }),
              ),
          ],
        ),
//      Center(
//        //child: Text(_wordPair.asPascalCase),
//      ),
        );
  }
}
