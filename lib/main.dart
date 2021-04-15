import 'package:flutter/material.dart';

import 'MyHomePage.dart';
import 'ArtistsPage.dart';
import 'AboutPage.dart';
import 'NotFound.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case MyHomePage.routeName:
            return MaterialPageRoute(builder: (BuildContext context) {
              return MyHomePage();
            });
          case ArtistsPage.routeName:
            return PageRouteBuilder(pageBuilder: (
              BuildContext context, 
              Animation animation1, 
              Animation animation2) {
                return ArtistsPage();
              },
              transitionsBuilder: (
                BuildContext context, 
                Animation animation, 
                Animation secondaryAnimation, 
                child) {
                  return FadeTransition(
                    opacity: animation, 
                    child: child);
                }
              );  
          case AboutPage.routeName:
            final args = settings.arguments as Map<String, dynamic>;       
            if (args != null 
                && args.containsKey('name') 
                && args.containsKey('text')) {                         
                        return PageRouteBuilder(
                pageBuilder: (
                  BuildContext context, 
                  Animation animation1,
                  Animation animation2)
                  {
                    return AboutPage(
                      name: args['name'],
                      text: args['text']
                      );   
                  },
                  transitionsBuilder: (
                    BuildContext context, 
                    Animation animation, 
                    Animation secondaryAnimation, 
                    child) {
                      CurvedAnimation _curved = CurvedAnimation(
                        parent: animation,
                        curve: Curves.fastOutSlowIn,
                      );
                      Animation<double> _animate = 
                        Tween<double>(begin: 0.0, end: 1.0).animate(_curved);
                      return ScaleTransition(
                        scale: _animate,
                        child: FadeTransition(
                          opacity: animation, 
                          child: child)
                        );
                    },
                  );
                }
            return MaterialPageRoute(builder: (BuildContext context) {
              return AboutPage();              
            });                        
          default:
            return MaterialPageRoute(builder: (BuildContext context) {
              return NotFound();              
            });              
        }
      },

      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

