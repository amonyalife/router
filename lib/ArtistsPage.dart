import 'package:flutter/material.dart';
import 'package:albums_route/fetch_file.dart' as fetch_file;
import 'dart:convert';

class ArtistsPage extends StatefulWidget {
  static const routeName = '/artists';
  static List artists;

  ArtistsPage({Key key}) : super(key: key);

  @override
  _ArtistsPageState createState() => _ArtistsPageState();
}

class _ArtistsPageState extends State<ArtistsPage> {
  String jsCode;  
  var filePath = 'assets/artists.json';  

  Future<void> getDta() async {    
      fetch_file.fetchFileFromAssets(filePath).then((vale){
        jsCode = vale;     
        print(jsCode);          
        this.setState(() {
          ArtistsPage.artists = jsonDecode(jsCode);
        });        
      });
    }
  
  @override
  void initState() {
    super.initState();
      this.getDta();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      appBar: AppBar(
        title: Text("Artists"),
        
        //automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[ 
        Expanded(
          child: ListView.builder(
            itemCount: ArtistsPage.artists.length,            
            itemBuilder: (context, index) {
              return GestureDetector(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                    child: Text(
                      ArtistsPage.artists[index]["name"],
                      style: TextStyle(fontSize: 18),
                    ),
                ),  

                onTap: () {
                  Navigator.of(context).pushNamed(
                    '/about', 
                    arguments: {
                      'name': ArtistsPage.artists[index]["name"],
                      'text': ArtistsPage.artists[index]["about"]
                      });                  
                }
              );      
            }            
          )
        ),      
        ]
      )
    );
  }
}
