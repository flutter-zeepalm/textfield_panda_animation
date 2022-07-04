import 'package:flutter/material.dart';
import 'package:rive_login/widgets/tripList.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.png"),
            fit: BoxFit.fitWidth,
            alignment: Alignment.topLeft
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  <Widget>[
             SizedBox(height: 30),
            SizedBox(
              height: 160,
              child: TweenAnimationBuilder(
                tween: Tween<double>(begin: 0,end: 1),
                  duration: Duration(milliseconds: 1000),
                  curve: Curves.easeIn,
                  builder: (BuildContext context,double _val,Widget? child){
                  return Opacity(
                      opacity: _val,
                    child: Padding(
                      padding: EdgeInsets.only(top: _val*50),
                      child: child,
                    ),
                  );
                  },
                child: const Text("Flutter Animation",
                  style: TextStyle(fontSize: 36, color: Colors.white, fontWeight: FontWeight.bold),
                )
              ),
            ),
            Flexible(
                child:  TripList()
            )
          ],
        ),
      ),
    );
  }
}
