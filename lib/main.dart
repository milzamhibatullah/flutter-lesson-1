import 'package:english_words/english_words.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

void main(){
  return runApp(MyApp());}


class MyApp extends StatelessWidget{
  @override
  
  Widget build(BuildContext context){
    FlutterStatusbarcolor.setStatusBarColor(Colors.blue);
    return MaterialApp(
      title: 'Welcome to flutter',
      home: RandomWords(),
      );
  }
}

class RandomWords extends StatefulWidget{
  @override 
  RandomWordsState createState()=> RandomWordsState();
}

class RandomWordsState extends State<RandomWords>{
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  Widget _buildSuggestions(){
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context,i){
        if(i.isOdd) return Divider();
        final index =i ~/2;
        if(index >= _suggestions.length){
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      }
    );
  } 
  Widget _buildRow(WordPair pair) {
  return ListTile(
    title: Text(
      pair.asPascalCase,
      style: _biggerFont,
    ),
  );
}
  @override
  Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(title: Text('Start up name generator'),
        ),
        body: _buildSuggestions(),
      );
    
  }
}