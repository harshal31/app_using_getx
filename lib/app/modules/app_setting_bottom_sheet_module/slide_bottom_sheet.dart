import 'package:flutter/cupertino.dart';

class SlideWidget extends StatefulWidget {
  final Widget child;
  final double begin;
  final double end;

  const SlideWidget({super.key, required this.child, this.begin = 1, this.end = 0});

  @override
  State<SlideWidget> createState() => _SlideState();
}

class _SlideState extends State<SlideWidget> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      key: widget.key,
      animation: _animationController,
      child: widget.child,
      builder: (ctx, child) => SlideTransition(
        position: Tween(
          begin: Offset(widget.begin, 0),
          end: Offset(widget.end, 0),
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        ),
        child: child,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }
}
