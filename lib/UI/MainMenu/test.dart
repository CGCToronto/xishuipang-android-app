import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Home Page"),
      ),
      body: new ListView(
        children: <Widget>[
          new ListTile(
            title: new TextField(
              controller: _textController,
            ),
          ),
          new ListTile(
            title: new RaisedButton(
              child: new Text("Next"),
              onPressed: () {
                var route = new MaterialPageRoute(
                  builder: (BuildContext context) =>
                  new NextPage(value: _textController.text),
                );
                Navigator.of(context).push(route);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class NextPage extends StatefulWidget {
  final String value;

  NextPage({Key key, this.value}) : super(key: key);

  @override
  _NextPageState createState() => new _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Next Page"),
      ),
      body: new Text("${widget.value}"),
    );
  }
}