import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ProfileButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text(
        'ยืนยัน',
        style: TextStyle(
          color: Color(0xFFEBF7FC),
          fontSize: 16,
          fontFamily: 'Noto Sans Thai',
          fontWeight: FontWeight.w600,
        ),
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        minimumSize: Size(100, 52),
      ),
    );
  }
}
