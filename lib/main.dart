import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/stopwatch.dart';
import 'dart:math';

import 'digital.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  stopwatch(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double sec = 0.1;
  double min = 0.1;
  double hour = 1;
  int f = 0;

  setSecond() {
    print(sec);
    setState(() {
      sec = sec + 0.1;
    });
    Future.delayed(Duration(seconds: 1), () {
      setSecond();
    });
  }

  setMinute() {
    print(min);
    setState(() {
      min = min + 0.1;
    });
    Future.delayed(Duration(minutes: 1), () {
      setSecond();
    });
  }

  setHour() {
    print(hour);
    setState(() {
      hour = hour + 1;
    });
    Future.delayed(Duration(hours: 1), () {
      setSecond();
    });
  }

  List number = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];

  @override
  void initState() {
    // TODO: implement initState
    setSecond();
    setMinute();
    setHour();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 2;
    double width = MediaQuery.of(context).size.width / 2;
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             DrawerHeader(child: Text('HEader')),
            ListTile(
              tileColor: Colors.grey.shade300,
              horizontalTitleGap: 25,
              title: Text('Analog Clock'),
            ),
            ListTile(
              tileColor: Colors.grey.shade300,
              horizontalTitleGap: 25,
              title: Text('Digital Clock'),
            ),
            ListTile(
              tileColor: Colors.grey.shade300,
              horizontalTitleGap: 25,
              title: Text('Stopwatch'),
            )
          ],
        ),
      ),
      endDrawer: Drawer(),
      body: Center(
        child: Container(
            height: 280,
            width: 280,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black,width: 5),
              shape: BoxShape.circle,
              color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.white54,spreadRadius:10,blurRadius: 10,blurStyle: BlurStyle.outer)]

            ),
            child: Center(
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      height: 180,
                      width: 180,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                        boxShadow: [BoxShadow(color: Colors.black54,spreadRadius: 3,blurRadius: 5)]
                      ),
                    ),
                  ),
                  for (int i = 0; i < number.length; i++)
                    Transform.rotate(
                      angle: (f += 120) * pi / 720,
                      child: Center(
                          child: Text(
                              "${number[i].toString()}\n\n\n\n\n\n\n\n\n\n\n\n",
                              style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w500))),
                    ),
                  // ,
                  Positioned(
                    top: 0.5,
                    right: 0.5,
                    left: 0.5,
                    bottom: 0.5,
                    child: Transform.rotate(
                      angle: hour,
                      child: Divider(
                        indent: 100,
                        endIndent: 80,
                        color: Colors.black,
                        thickness: 7,
                      ),
                    ),
                  ),

                  Positioned(
                    top: 0.5,
                    right: 0.5,
                    left: 0.5,
                    bottom: 0.5,
                    child: Transform.rotate(
                      angle: min,
                      child: Divider(
                        indent: 100,
                        endIndent: 40,
                        color: Colors.black,
                        thickness:4,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0.5,
                    right: 0.5,
                    left: 0.5,
                    bottom: 0.5,
                    child: Transform.rotate(
                      angle: sec,
                      child: Divider(
                        indent: 100,
                        endIndent: 10,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
