import 'package:flutter/material.dart';

class CustomOnTapGestureDetector extends GestureDetector {
  CustomOnTapGestureDetector({
    super.key,
    Function()? super.onTap,
    super.child,
  }) : super(
          behavior: HitTestBehavior.opaque,
        );
}
