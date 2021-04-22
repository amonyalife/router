import 'package:flutter/material.dart';
import 'package:albums_route/fetch_file.dart' as fetch_file;
import 'dart:convert';

class ArtistsPage extends StatefulWidget {
  static const routeName = '/artists';
  static List artists= [];
  

  ArtistsPage({Key key}) : super(key: key);

  @override
  _ArtistsPageState createState() => _ArtistsPageState();
}

class _ArtistsPageState extends State<ArtistsPage> {
  final List listTiles=['Home' 'Artists'];
  List <bool> isSelected=[false,false];
  int countS=0;
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
      drawer: Drawer(
        child: Column(      
            
          children: <Widget>[
          SizedBox(           
            height: 50,           
          ),     
          ListView.separated(
            itemCount: listTiles.length,
            separatorBuilder: (BuildContext context, int index)=> Divider(height: 1, color: Colors.red),
            itemBuilder: (BuildContext context, int index)=> ListTile(
              tileColor: Colors.black,
              title: Text(listTiles[index]),
              selectedTileColor: Colors.green,
              selected: isSelected[index],
              onLongPress:(){ _upgradeTile(index);
                setState(() {
                  
                });
              
              },
              onTap:
                     
                    
                  countS>=1 ? () {
                    Navigator.of(context).pushNamed('/artists'); 
                    _upgradeTile(index);
                    setState(() {
                      
                    });                    

                  }:(){}
                      
              ),

                          ),
         
            // ListTile(
            //   selectedTileColor: Colors.blue,
            //   leading: Icon(Icons.home),
            //   title: Text('Home'),            
            //   onTap: (){
         
            //     print('ON TAP');
            //     Navigator.of(context).pushNamed('/');
            //   },
            // ),
            // ListTile(
            //   selectedTileColor: Colors.blue,
            //   leading: Icon(Icons.article_outlined),
            //   title: Text('Artists'),
            //   onTap: (){
            //     Navigator.of(context).pushNamed('/artists');              
            //   },
            // ),                                                         
          ],        
          ),
              
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
  _upgradeTile(int index){
   if (isSelected[index]==true){
          isSelected[index]=false;
          --countS;
          }
          else{
             isSelected[index]=true;
             ++countS;
          }
   }
  }


