import 'package:flutter/material.dart';

class digitalClock extends StatefulWidget {
  const digitalClock({super.key});

  @override
  State<digitalClock> createState() => _digitalClockState();
}

class _digitalClockState extends State<digitalClock> {
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
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      body: Center(
        child: Container(
          height: 200,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.red.shade300, blurRadius: 40, spreadRadius: 5)
            ],
          ),
          child: Row(
            children: [
              Text(
                DateTime.now().hour.toString(),
                style: TextStyle(color: Colors.red, fontSize: 70),
              ),
              Text(":", style: TextStyle(color: Colors.red, fontSize: 70),),
              Text(DateTime.now().minute.toString(), style: TextStyle(color: Colors.red, fontSize: 70),),
              Text(":", style: TextStyle(color: Colors.red, fontSize: 70),),
              Text(DateTime.now().second.toString(), style: TextStyle(color: Colors.red, fontSize: 70),),
            ],
          ),
        ),
      ),
    );
  }
}
