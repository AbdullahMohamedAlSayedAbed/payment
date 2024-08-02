import 'package:flutter/material.dart';
import 'package:paymentapp/core/utils/app_style.dart';

class OrderInfoItem extends StatelessWidget {
  const OrderInfoItem({super.key, required this.title, required this.price});
  final String title, price;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: AppStyle.styleRegular18, textAlign: TextAlign.center),
        Text(price,
            style: AppStyle.styleRegular18, textAlign: TextAlign.center),
      ],
    );
  }
}
