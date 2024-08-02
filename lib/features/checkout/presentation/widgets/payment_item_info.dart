import 'package:flutter/material.dart';
import 'package:paymentapp/core/utils/app_style.dart';

class PaymentItemInfo extends StatelessWidget {
  const PaymentItemInfo({super.key, required this.title, required this.value});
  final String value, title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppStyle.styleRegular18,
        ),
        Text(
          value,
          style: AppStyle.styleBold18,
        )
      ],
    );
  }
}
