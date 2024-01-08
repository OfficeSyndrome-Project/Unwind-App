import 'package:flutter/material.dart';

class GeneralAnimatedCustomRadio<Type> extends StatefulWidget {
  final Type? value;
  final Type? groupValue;
  final ValueChanged<dynamic>? onChanged;
  final Color activeColor;
  final Color inactiveColor;

  const GeneralAnimatedCustomRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.activeColor,
    required this.inactiveColor,
  });

  @override
  _GeneralAnimatedCustomRadioState createState() =>
      _GeneralAnimatedCustomRadioState();
}

class _GeneralAnimatedCustomRadioState extends State<GeneralAnimatedCustomRadio>
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

    _controller.value = (widget.value == widget.groupValue ? 1.0 : 0.0);

    _controller.addListener(() {
      setState(() {}); // Rebuild the widget as the animation progresses
    });
  }

  @override
  void didUpdateWidget(GeneralAnimatedCustomRadio oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.value != widget.value) {
      if (widget.value == widget.groupValue) {
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
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        width: 22.0,
        height: 22.0,
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
                  width: 12.0,
                  height: 12.0,
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
