import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  static const routeName = '/';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Routes'),
      ),
      drawer: Drawer(child: Column(        
        children: <Widget>[
        Container(           
          height: 50,           
        ),            
          ListTile(
            selectedTileColor: Colors.blue,
            leading: Icon(Icons.home),
            title: Text('Home'),            
            onTap: (){
              print('ON TAP');
              Navigator.of(context).pushNamed('/');
            },
          ),
          ListTile(
            selectedTileColor: Colors.blue,
            leading: Icon(Icons.article_outlined),
            title: Text('Artists'),
            onTap: (){
              Navigator.of(context).pushNamed('/artists');              
            },
          ),                                                         
        ],        
        )        
        ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Routes',
            ),
          ],
        ),
      ),
    );
  }
}
