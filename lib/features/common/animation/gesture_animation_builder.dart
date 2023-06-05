import 'package:flutter/material.dart';

class GestureAnimationBuilder extends StatefulWidget {
  const GestureAnimationBuilder({
    required this.builder,
    this.onPressed,
    this.duration = const Duration(milliseconds: 100),
    this.behavior,
    Key? key,
  }) : super(key: key);

  final Duration duration;
  final VoidCallback? onPressed;
  final Widget Function(BuildContext context, AnimationController ac) builder;
  final HitTestBehavior? behavior;

  @override
  State<GestureAnimationBuilder> createState() => _GestureAnimationBuilderState();
}

class _GestureAnimationBuilderState extends State<GestureAnimationBuilder> with TickerProviderStateMixin {
  late AnimationController _ac;

  @override
  void initState() {
    super.initState();
    _ac = AnimationController(vsync: this, duration: widget.duration);
  }

  @override
  void dispose() {
    _ac.dispose();

    super.dispose();
  }

  void _animationStatusResetListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _ac.reverse();
      _ac.removeStatusListener(_animationStatusResetListener);
    }
  }

  void _handleTapDown() {
    if (widget.onPressed != null) {
      _ac.forward();
    }
  }

  void _handleTapCancel() {
    if (widget.onPressed != null) {
      if (_ac.status != AnimationStatus.completed) {
        _ac.addStatusListener(_animationStatusResetListener);
      } else {
        _ac.reverse();
      }
    }
  }

  void _handleTapUp() {
    if (widget.onPressed != null) {
      widget.onPressed!.call();

      if (_ac.status != AnimationStatus.completed) {
        _ac.addStatusListener(_animationStatusResetListener);
      } else {
        _ac.reverse();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _ac,
      builder: (context, __) => GestureDetector(
        onTapDown: (_) => _handleTapDown(),
        onTapCancel: () => _handleTapCancel(),
        onTapUp: (_) => _handleTapUp(),
        behavior: widget.behavior,
        child: widget.builder(context, _ac),
      ),
    );
  }
}
