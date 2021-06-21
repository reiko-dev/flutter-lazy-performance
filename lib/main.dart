import 'package:flutter/material.dart';

import 'procedural_generation_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Builder Performance Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: <String, Widget Function(BuildContext)>{
        '/': (BuildContext context) => MyHomePage(),
        ProceduralGenerationPage.routeName: (BuildContext context) =>
            ProceduralGenerationPage(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lazy Performance Demos'),
      ),
      body: ListView(
        children: <Widget>[
          const MyListItem(
            route: '/procedural-generation',
            title: 'InteractiveViewer.builder Procedural Generation Example',
            subtitle: 'Generate the content to build.',
          ),
        ],
      ),
    );
  }
}

class MyListItem extends StatelessWidget {
  const MyListItem({
    required this.route,
    required this.subtitle,
    required this.title,
  });

  final String route;
  final String subtitle;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(route);
      },
      child: Card(
        margin: EdgeInsets.all(12.0),
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: ListTile(
            title: Text(title),
            subtitle: Text(subtitle),
          ),
        ),
      ),
    );
  }
}
