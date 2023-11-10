import 'package:flutter/material.dart';

class InkWellWidget extends StatelessWidget {
  final VoidCallback? onTap, onLongPress;
  final Widget? child;
  final EdgeInsetsGeometry? padding;

  const InkWellWidget({
    Key? key,
    this.onTap,
    this.onLongPress,
    this.padding,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        child: Padding(
          padding: padding ?? const EdgeInsets.all(0),
          child: child,
        ),
      ),
    );
  }
}
