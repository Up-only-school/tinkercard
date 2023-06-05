import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class StateAnimationBuilder extends StatefulHookWidget {
  const StateAnimationBuilder({
    required this.builder,
    required this.state,
    this.onStateChange,
    this.duration = const Duration(milliseconds: 100),
    Key? key,
  }) : super(key: key);

  final Duration duration;
  final bool state;
  final VoidCallback? onStateChange;
  final Widget Function(BuildContext context, AnimationController ac) builder;

  @override
  State<StateAnimationBuilder> createState() => _StateAnimationBuilderState();
}

class _StateAnimationBuilderState extends State<StateAnimationBuilder> with TickerProviderStateMixin {
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
      widget.onStateChange!();
      _ac.reverse();
      _ac.removeStatusListener(_animationStatusResetListener);
    }
  }

  void _handleTapDown() {
    if (widget.onStateChange != null) {
      _ac.forward();
    }
  }

  void _handleTapCancel() {
    if (widget.onStateChange != null && _ac.status == AnimationStatus.completed) {
      _ac.reverse();
    }
  }

  void _handleTapUp() {
    if (widget.onStateChange != null) {
      if (_ac.status != AnimationStatus.completed) {
        _ac.addStatusListener(_animationStatusResetListener);
      } else {
        widget.onStateChange!();
        _ac.reverse();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      if (widget.state) {
        _ac.forward();
      } else {
        _ac.reverse();
      }

      return null;
    }, [widget.state]);

    return AnimatedBuilder(
      animation: _ac,
      builder: (context, __) => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTapDown: (_) => _handleTapDown(),
        onTapCancel: () => _handleTapCancel(),
        onTapUp: (_) => _handleTapUp(),
        child: widget.builder(context, _ac),
      ),
    );
  }
}
