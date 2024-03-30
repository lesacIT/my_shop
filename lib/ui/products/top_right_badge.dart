import 'package:flutter/material.dart';

class TopRightBadge extends StatelessWidget {
  const TopRightBadge({
    super.key,
    required this.child,
    required this.data,
    this.color,
    this.textColor = Colors.white, // Màu chữ mặc định là trắng
  });

  final Widget child;
  final Object data;
  final Color? color;
  final Color textColor; // Thêm thuộc tính textColor

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          right: 8,
          top: 8,
          child: Container(
            padding: const EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: color ?? Theme.of(context).colorScheme.secondary,
            ),
            constraints: const BoxConstraints(
              minWidth: 15,
              minHeight: 15,
            ),
            child: Text(
              data.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 9,
                color: textColor, // Sử dụng màu chữ được truyền vào
              ),
            ),
          ),
        )
      ],
    );
  }
}
