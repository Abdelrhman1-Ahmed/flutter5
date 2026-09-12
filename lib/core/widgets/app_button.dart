import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color textColor;
  final Widget? icon;
  final String? trailingText;
  final double height;
  final double borderRadius;
  final bool isOutlined;
  final Color? borderColor;

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundColor = AppColors.primary,
    this.textColor = Colors.white,
    this.icon,
    this.trailingText,
    this.height = 60,
    this.borderRadius = 19,
    this.isOutlined = false,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: Material(
        color: isOutlined ? Colors.transparent : backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(borderRadius),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              border: isOutlined
                  ? Border.all(
                      color: borderColor ?? AppColors.primary,
                      width: 1.5,
                    )
                  : null,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) ...[
                  icon!,
                  const SizedBox(width: 12),
                ],
                Expanded(
                  child: Text(
                    text,
                    textAlign: trailingText != null ? TextAlign.left : TextAlign.center,
                    style: TextStyle(
                      color: isOutlined
                          ? (borderColor ?? AppColors.primary)
                          : textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                if (trailingText != null)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      trailingText!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
