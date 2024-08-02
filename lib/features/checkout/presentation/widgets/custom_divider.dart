import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    this.height,
  });

  final double? height;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: const Color(0xffC7C7C7),
      thickness: 2,
      height: height ?? 34,
      indent: 15,
      endIndent: 15,
    );
  }
}
