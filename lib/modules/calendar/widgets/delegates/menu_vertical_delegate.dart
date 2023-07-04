import 'package:flutter/material.dart';

class FabVerticalDelegate extends FlowDelegate {
  final AnimationController animation;

  FabVerticalDelegate({required this.animation}) : super(repaint: animation);

  @override
  void paintChildren(FlowPaintingContext context) {
    const buttonSize = 56;
    const buttonRadius = buttonSize / 2;
    const buttonMargin = 10;

    final postionX = context.size.width - buttonSize;
    final postionY = context.size.height - buttonSize;
    final lastFabIndex = context.childCount - 1;

    for (int index = lastFabIndex; index >= 0; index--) {
      final y =
          postionY - ((buttonSize + buttonMargin) * index * animation.value);
      final size = (index != 0) ? animation.value : 1.0;
      context.paintChild(
        index,
        transform: Matrix4.translationValues(postionX, y, 0)
          ..translate(buttonRadius, buttonRadius)
          ..scale(size)
          ..translate(-buttonRadius, -buttonRadius),
      );
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) => false;
}
