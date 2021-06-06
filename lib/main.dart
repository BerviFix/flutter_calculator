import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(title: 'Flutter Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String displayString = '0';
  String numberString = '0';

  Widget createRow(
    String title1,
    String title2,
    String title3,
    String title4,
  ) {
    return Expanded(
      child: Row(
        children: [
          createButton(title1),
          createButton(title2),
          createButton(title3),
          createButton(title4),
        ],
      ),
    );
  }

  Widget createButton(String title) {
    return Expanded(
      child: ButtonTheme(
        height: double.infinity,
        child: OutlineButton(
          onPressed: () => pressButton(title),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1,
          ),
          highlightedBorderColor: Colors.black,
        ),
      ),
    );
  }

  pressButton(String title) {
    setState(() {
      if (title == '+' || title == '-' || title == '*' || title == '/') {
        numberString = '';
      } else if (title == '=') {
      } else if (title == 'CE') {
        numberString = '';
        displayString = '0';
      } else {
        if (numberString == '0' || numberString == '0.0') {
          numberString = '';
        }
        numberString += title;
        displayString = numberString;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                color: Color.fromARGB(10, 0, 0, 0),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Align(
                    alignment: FractionalOffset.bottomRight,
                    child: Text(
                      displayString,
                      style: TextStyle(fontSize: 80),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  createRow('+', ' -', '*', ' /'),
                  createRow('7', '8', '9', '0'),
                  createRow('4', '5', '6', 'CE'),
                  createRow('1', '2', '3', '='),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
