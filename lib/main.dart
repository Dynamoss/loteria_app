import 'package:flutter/material.dart';
import 'dart:math';

import 'package:loteria_app/widgets/luck_ball.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Loteria - Caixa',
      theme: ThemeData(
        // This is the theme of your application.
        //

        primarySwatch: Colors.blue,

        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Container(child: MyHomePage(title: 'Mega Sena')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int i, j, n;
  Random m;
  
  List<int> jogo = new List<int>();
  List<int> usados = new List<int>();

  void _sortear() {
    setState(() {
      for (i = 1; i <= 10; i++) {
        jogo.clear();
        for (j = 1; j <= 6; j++) {
          m = new Random();
          n = m.nextInt(60) + 1;

          jogo.add(n);
          usados.add(n);
        }
        break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: 16.0, top: 16.0, bottom: 16.0),
          child: Image.asset("assets/images/caixaLogo.png"),
        ),
        title: Text(widget.title),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Pressione o botão para gerar o sorteio:',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0066b3)),
              ),
              Wrap(
                children: jogo
                    .map((e) => Container(
                          margin: EdgeInsets.only(
                              right: 8.0, top: 8.0, bottom: 8.0),
                          child: LuckBall(
                            number: e,
                            isEnabled: true,
                            mutable: false,
                          ),
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff0066b3),
        onPressed: _sortear,
        child: Icon(Icons.local_activity),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
