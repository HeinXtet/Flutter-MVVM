import 'package:flutter/material.dart';

class SlidingAnimatedWidget extends StatefulWidget {
  final Widget child;

  const SlidingAnimatedWidget({Key? key, required this.child})
      : super(key: key);

  @override
  _SlidingAnimatedWidgetState createState() => _SlidingAnimatedWidgetState();
}

class _SlidingAnimatedWidgetState extends State<SlidingAnimatedWidget> {
  var isStarted = false;

  @override
  void initState() {
    isStarted = false;
    super.initState();
    Future.delayed(const Duration(milliseconds: 500)).then(
      (value) => {
        setState(() {
          isStarted = true;
        })
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      alignment: isStarted ? Alignment.center : Alignment.centerLeft,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
      child: widget.child,
    );
  }
}
