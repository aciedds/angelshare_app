import 'package:flutter/material.dart';

class GlowingOrb extends StatefulWidget {
  final double radius;
  final Color color;
  final Offset initialPosition;

  const GlowingOrb({
    super.key,
    required this.radius,
    required this.color,
    required this.initialPosition,
  });

  @override
  State<GlowingOrb> createState() => _GlowingOrbState();
}

class _GlowingOrbState extends State<GlowingOrb> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 0.85, end: 1.15).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _opacityAnimation = Tween<double>(begin: 0.15, end: 0.35).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widget.initialPosition.dx - widget.radius,
      top: widget.initialPosition.dy - widget.radius,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final currentRadius = widget.radius * _scaleAnimation.value;
          final currentOpacity = _opacityAnimation.value;
          
          return Container(
            width: currentRadius * 2,
            height: currentRadius * 2,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  widget.color.withValues(alpha: currentOpacity),
                  widget.color.withValues(alpha: currentOpacity * 0.4),
                  widget.color.withValues(alpha: 0.0),
                ],
                stops: const [0.0, 0.5, 1.0],
              ),
            ),
          );
        },
      ),
    );
  }
}
