import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  static const routeName = '/about';
  final String name, text;
  
  AboutPage({Key key, this.name, this.text}) : super(key: key);
  
  @override
  _AboutPageState createState() => _AboutPageState();
}


class _AboutPageState extends State<AboutPage> { 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 
          widget.name != null 
            ? Text('${widget.name}') 
            : Text('About page'),        
        //automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: widget.text != null 
           ? Text('${widget.text}') 
           : Text('About page'),
        )
    );
  }
}