import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paymentapp/core/utils/app_images.dart';

class CustomTrueImage extends StatelessWidget {
  const CustomTrueImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundColor: const Color(0xffEDEDED),
      child: CircleAvatar(
        radius: 40,
        backgroundColor: const Color(0xff34A853),
        child: SvgPicture.asset(Assets.imagesTrue),
      ),
    );
  }
}
