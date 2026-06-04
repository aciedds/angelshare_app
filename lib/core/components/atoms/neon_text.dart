import 'package:flutter/material.dart';

class NeonText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Color glowColor;
  final double glowBlurRadius;
  final TextAlign? textAlign;

  const NeonText({
    super.key,
    required this.text,
    required this.glowColor,
    this.style,
    this.glowBlurRadius = 12.0,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    final baseStyle = style ?? Theme.of(context).textTheme.bodyLarge ?? const TextStyle();
    
    return Text(
      text,
      textAlign: textAlign,
      style: baseStyle.copyWith(
        shadows: [
          Shadow(
            color: glowColor.withValues(alpha: 0.45),
            blurRadius: glowBlurRadius * 0.8,
          ),
        ],
      ),
    );
  }
}
