import 'package:flutter/material.dart';

class Skeleton extends StatefulWidget {
  final double? width;
  final double? height;
  final double borderRadius;
  final Widget? child;

  const Skeleton({
    super.key,
    this.width,
    this.height,
    this.borderRadius = 16.0,
    this.child,
  });

  @override
  State<Skeleton> createState() => _SkeletonState();
}

class _SkeletonState extends State<Skeleton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();

    _animation = Tween<double>(begin: -1.5, end: 1.5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutSine),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: const [
                Color(0x0CFFFFFF), // Very subtle base glass white
                Color(0x24FFFFFF), // Shimmer glass highlight
                Color(0x0CFFFFFF), // Very subtle base glass white
              ],
              stops: const [0.0, 0.5, 1.0],
              transform: _SlidingGradientTransform(slideValue: _animation.value),
            ),
            border: Border.all(
              color: const Color(0x1BFFFFFF),
              width: 1.0,
            ),
          ),
          child: widget.child,
        );
      },
    );
  }
}

class _SlidingGradientTransform extends GradientTransform {
  final double slideValue;

  const _SlidingGradientTransform({required this.slideValue});

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * slideValue, 0.0, 0.0);
  }
}
