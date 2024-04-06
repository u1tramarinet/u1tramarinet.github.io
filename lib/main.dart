import 'package:flutter/material.dart';
import 'package:u1tramarinet/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'u1tramarinet\'s developer site',
      theme: ThemeData(
        // colorSchemeSeed: ultramarine,
        primarySwatch: ultramarinePrimarySwatch,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: ultramarine,
        // primarySwatch: ultramarinePrimarySwatch,
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      home: const MyHomePage(title: 'u1tramarinet\'s developer site (Under construction...)'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final bool _debug = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(child: 
      Padding(padding: const EdgeInsets.all(32),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _section(title: 'What\'s u1tramarinet?', body: 'A. ultramarine + net'),
            _divider(),
            _section(title: 'Released apps', body: 'No one'),
            _divider(),
            _section(title: 'Preparing apps', body: 'Under construction...'),
            _divider(),
            _section(title: 'Contact', body: 'Under construction...'),
          ],
        ),)),
    );
  }

  Widget _section({required String title, required String body}) {
    return Container(color: _debugColor(isDebug: Colors.red),child: Padding(padding: const EdgeInsets.all(8),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      _title(title),
      _body(body),
    ],
    ),
    ),);
  }

  Widget _title(String title) {
    return Container(color: _debugColor(isDebug: Colors.blue),
    child: Padding(padding: const EdgeInsets.symmetric(vertical: 16),
    child: Text(
              title,
              style: Theme.of(context).textTheme.headlineLarge,
              textAlign: TextAlign.start,
            )
            ),);
  }

  Widget _body(String body) {
    return Container(color: _debugColor(isDebug: Colors.green),child: Padding(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
    child: Text(
              body,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.start,
            ),
            ),);
  }

  Widget _divider() {
    return const Divider(
      height: 32,
    );
  }

  Color _debugColor({required Color isDebug}) {
    return _debug ? isDebug : Colors.transparent;
  }
}
