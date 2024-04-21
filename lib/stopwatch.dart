import 'package:flutter/material.dart';

class stopwatch extends StatefulWidget {
  const stopwatch({super.key});

  @override
  State<stopwatch> createState() => _stopwatchState();
}

class _stopwatchState extends State<stopwatch> {
  int hour=0;
  int min=0;
  double sec=0;
  bool value=false;
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
      min = min +1;
    });
    Future.delayed(Duration(minutes: 1), () {
      setMinute();
    });
  }

  setHour() {
    print(hour);
    setState(() {
      hour = hour + 1;
    });
    Future.delayed(Duration(hours: 1), () {
      setHour();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      body: Center(
        child: Column(
          children: [
            // Container(
            //   height: 300,
            //   width: 300,
            //   decoration: BoxDecoration(
            //     shape: BoxShape.circle,
            //     color: Colors.black,
            //     border: Border.all(color: Colors.grey.shade500,width: 5),
            //   ),
            //  // child: ,
            // ),
            Row(
              children: [
                Text(hour.toString()),
                Text(':'),
                Text(min.toString()),
                Text(':'),
                Text(sec.toString()),
                Divider(thickness: 5,indent: 5,endIndent: 5,color: Colors.grey,)

              ],
            ),
            SizedBox(height: 100,),
            InkWell(
                OnTap:(){

    }

                child: Icon(Icons.play_circle_outline_outlined,size: 25,)),
          ],
        ),

      ),
    );
  }
}
