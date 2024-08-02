import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paymentapp/core/utils/app_images.dart';

import '../utils/app_style.dart';

AppBar buildAppBar({final String? title, required void Function() onTap}) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    title: Text(
      title ?? '',
      style: AppStyle.styleMedium25,
    ),
    centerTitle: true,
    leading: GestureDetector(
        onTap: onTap,
        child: Center(child: SvgPicture.asset(Assets.imagesArrow))),
  );
}
