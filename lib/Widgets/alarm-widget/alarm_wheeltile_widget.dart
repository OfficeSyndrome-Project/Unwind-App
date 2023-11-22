import 'package:flutter/material.dart';

class WheelTile extends StatelessWidget {
  final String textstates;

  const WheelTile(this.textstates, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '$textstates นาที',
        style: const TextStyle(
          fontFamily: 'Noto Sans Thai',
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Color(0xFF6285D7),
        ),
      ),
    );
  }
}
