import 'package:flutter/material.dart';

class AnimatedIcons2 extends StatefulWidget {
  const AnimatedIcons2({super.key});

  @override
  State<AnimatedIcons2> createState() => _AnimatedIcons2State();
}

class _AnimatedIcons2State extends State<AnimatedIcons2> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool play=false;
  void _animate(){
    play?_animationController.reverse():_animationController.forward();
    play=!play;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController=AnimationController(vsync: this,duration: Duration(seconds: 1));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(onTap: _animate,child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedIcon(
            icon: AnimatedIcons.add_event,
            progress: _animationController,
            size: 100,
          ),
          AnimatedIcon(
            icon: AnimatedIcons.close_menu,
            progress: _animationController,
            size: 100,
          ),
          AnimatedIcon(
            icon: AnimatedIcons.home_menu,
            progress: _animationController,
            size: 100,
          ),
          AnimatedIcon(
            icon: AnimatedIcons.ellipsis_search,
            progress: _animationController,
            size: 100,
          ),
          AnimatedIcon(
            icon: AnimatedIcons.view_list,
            progress: _animationController,
            size: 100,
          ),
          AnimatedIcon(
            icon: AnimatedIcons.pause_play,
            progress: _animationController,
            size: 100,
          ),
          Row()
        ],
      )),
    );
  }
}