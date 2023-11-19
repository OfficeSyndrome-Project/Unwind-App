// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';

class AnimatedCustomRadio extends StatefulWidget {
  final bool value;
  final bool? groupValue;
  final ValueChanged<bool?>? onChanged;
  final Color activeColor;
  final Color inactiveColor;

  const AnimatedCustomRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.activeColor,
    required this.inactiveColor,
  });

  @override
  _AnimatedCustomRadioState createState() => _AnimatedCustomRadioState();
}

class _AnimatedCustomRadioState extends State<AnimatedCustomRadio>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200), // Set the animation duration
    );

    _colorAnimation = ColorTween(
      begin: widget.inactiveColor, // Use the inactive color
      end: widget.activeColor, // Use the active color
    ).animate(_controller);

    _controller.value = widget.value ? 1.0 : 0.0;

    _controller.addListener(() {
      setState(() {}); // Rebuild the widget as the animation progresses
    });
  }

  @override
  void didUpdateWidget(AnimatedCustomRadio oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.value != widget.value) {
      if (widget.value) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onChanged?.call(widget.value);
      },
      child: Container(
        width: 24.0,
        height: 24.0,
        margin: const EdgeInsets.only(right: 4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: _colorAnimation.value ??
                Colors.transparent, // Handle null color
            width: 2.0,
          ),
        ),
        child: widget.value == widget.groupValue
            ? Center(
                child: Container(
                  width: 15.0,
                  height: 15.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _colorAnimation.value ??
                        Colors.transparent, // Handle null color
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
