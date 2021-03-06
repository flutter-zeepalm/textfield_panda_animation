import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation _colorAnimation;
  late Animation _sizeAnimation;
  bool isFav = false;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this,duration: Duration(milliseconds: 300));
    _colorAnimation = ColorTween(begin:Colors.grey,end:Colors.red,).animate(_controller);
    _sizeAnimation = TweenSequence(
        <TweenSequenceItem<double>>[
          TweenSequenceItem(tween: Tween(begin: 30,end: 50), weight: 50),
          TweenSequenceItem(tween: Tween(begin: 50,end: 30), weight: 50),
        ]
    ).animate(_controller);
    _controller.addListener(() {
      print(_controller.value);
    });
    _controller.addStatusListener((status) {
      if(status==AnimationStatus.completed){
        setState((){
          isFav = true;
        });
      }
      if(status==AnimationStatus.dismissed){
        setState((){
          isFav = false;
        });
      }
    });
  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, _) {
        return IconButton(
          icon: Icon(
            Icons.favorite,
            color: _colorAnimation.value,
            size: _sizeAnimation.value,
          ),
          onPressed: () {
            isFav?_controller.reverse():
            _controller.forward();
          },
        );
      }
    );
  }
}