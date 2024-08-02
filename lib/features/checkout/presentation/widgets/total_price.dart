import 'package:flutter/material.dart';
import 'package:paymentapp/core/utils/app_style.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({super.key, required this.title, required this.price});
  final String title, price;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: AppStyle.styleSemiBold24, textAlign: TextAlign.center),
        Text(price,
            style: AppStyle.styleSemiBold24, textAlign: TextAlign.center),
      ],
    );
  }
}
