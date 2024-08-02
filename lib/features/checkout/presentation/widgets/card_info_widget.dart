import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:paymentapp/core/utils/app_images.dart';
import 'package:paymentapp/core/utils/app_style.dart';

class CardInfoWidget extends StatelessWidget {
  const CardInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 16),
        height: 78,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            SvgPicture.asset(Assets.imagesLogo),
            const SizedBox(width: 23),
            const Text(
              'Credit Card\nMastercard **78 ',
              style: AppStyle.styleRegular18,
            ),
          ],
        ));
  }
}
