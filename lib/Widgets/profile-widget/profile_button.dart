import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
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
