import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paymentapp/core/utils/app_images.dart';
import 'package:paymentapp/core/utils/app_style.dart';
import 'package:paymentapp/features/checkout/presentation/widgets/custom_divider.dart';
import 'package:paymentapp/features/checkout/presentation/widgets/total_price.dart';

import 'card_info_widget.dart';
import 'payment_item_info.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: const Color(0xffEDEDED),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.only(top: 66, left: 22, right: 23),
        child: Column(
          children: [
            const Text(
              'Thank you!',
              style: AppStyle.styleMedium25,
              textAlign: TextAlign.center,
            ),
            Text(
              'Your transaction was successful',
              style: AppStyle.styleRegular20,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 42),
            const PaymentItemInfo(
              title: 'Date',
              value: '01/24/2023',
            ),
            const SizedBox(height: 20),
            const PaymentItemInfo(
              title: 'Time',
              value: '10:15 AM',
            ),
            const SizedBox(height: 20),
            const PaymentItemInfo(
              title: 'To',
              value: 'Sam Louis',
            ),
            const CustomDivider(
              height: 28 * 2,
            ),
            const TotalPrice(title: 'Total', price: r'$50.97'),
            const SizedBox(height: 30),
            const CardInfoWidget(),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(Assets.imagesIconMenu),
                Container(
                  width: 113,
                  height: 50,
                  decoration: BoxDecoration(
                    border:
                        Border.all(width: 1.5, color: const Color(0xff34A853)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      'PAID',
                      style: AppStyle.styleSemiBold24
                          .copyWith(color: const Color(0xff34A853)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: ((MediaQuery.sizeOf(context).height * 0.2 + 20) / 2) - 36,
            )
          ],
        ),
      ),
    );
  }
}
