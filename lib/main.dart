import 'package:flutter/material.dart';
import 'package:flutter_module8_assignment/pages/home_page.dart';
import 'package:flutter_module8_assignment/resources/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:  Scaffold(
        backgroundColor:PRIMARY_COLOR,
        floatingActionButton: Padding(
          padding: EdgeInsets.only(top: 5),
          child: SizedBox(
            height: 70,
            width: 70,
            child: FloatingActionButton(
              backgroundColor: Colors.transparent,
              elevation: 10,
              onPressed: () {},
              child: Container(
                height: 75,
                width: 75,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 14),
                    shape: BoxShape.circle,
                    color: Colors.blue
                ),
                child: Icon(Icons.add, size: 30),
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar:
        BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex:1 ,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label:'',
                  backgroundColor: Colors.black
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.date_range),
                label:'',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark_border,color: Colors.transparent,),
                label:'',
              ),

              BottomNavigationBarItem(
                icon: Icon(Icons.access_time),
                label:'',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label:'',
              ),

            ]),
        body: HomePage(),
        /*Container(
          height: 80.0,
          color: Colors.white10,
          padding: EdgeInsets.only(top: 20.0),
          child: Theme(
            data: Theme.of(context).copyWith(
              // sets the background color of the `BottomNavigationBar`
                canvasColor: Colors.white,
                // sets the active color of the `BottomNavigationBar` if `Brightness` is light
                primaryColor: Colors.red,
                bottomAppBarColor: Colors.green,
                textTheme: Theme
                    .of(context)
                    .textTheme
                    .copyWith(caption: new TextStyle(color: Colors.grey))), // sets the inactive color of the `BottomNavigationBar`
            child:
            BottomNavigationBar(

                type: BottomNavigationBarType.fixed,
                currentIndex:0 ,
                items: [
                  BottomNavigationBarItem(
                      icon: new Icon(Icons.home),
                      label:'',
                      backgroundColor: Colors.black
                  ),
                  BottomNavigationBarItem(
                    icon: new Icon(Icons.date_range),
                    label:'',
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.bookmark_border,color: Colors.transparent,),
                    label:'',
                  ),

                  BottomNavigationBarItem(
                      icon: Icon(Icons.access_time),
                    label:'',
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                    label:'',
                  ),

                ]),
          ),
        ),*/
      ),
    );
  }
}

