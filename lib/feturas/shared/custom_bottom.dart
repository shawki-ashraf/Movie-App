import 'package:flutter/material.dart';

class WatchNowButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const WatchNowButton({
    super.key,
    required this.onPressed,
    this.text = 'Watch Now', // 👈 القيمة الافتراضية
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 18),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 8,
        shadowColor: Colors.black.withOpacity(0.4),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
