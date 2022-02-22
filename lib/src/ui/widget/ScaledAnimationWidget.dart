import 'package:flutter/material.dart';

class ScaledAnimatedWidget extends StatefulWidget {
  final Widget child;

  const ScaledAnimatedWidget({Key? key, required this.child}) : super(key: key);

  @override
  _ScaledAnimatedWidgetState createState() => _ScaledAnimatedWidgetState();
}

class _ScaledAnimatedWidgetState extends State<ScaledAnimatedWidget>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController _controller;

  @override
  void initState() {
      _controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 1),
      );
      animation = CurvedAnimation(parent: _controller, curve: Curves.linear);
      super.initState();
      _controller.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(scale: animation, child: widget.child);
  }
}
