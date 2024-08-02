import 'package:flutter/material.dart';
import 'package:paymentapp/core/utils/app_images.dart';
import 'package:paymentapp/features/checkout/presentation/widgets/payment_method_item.dart';

class PaymentMethodsListView extends StatefulWidget {
  const PaymentMethodsListView({super.key});

  @override
  State<PaymentMethodsListView> createState() => _PaymentMethodsListViewState();
}

class _PaymentMethodsListViewState extends State<PaymentMethodsListView> {
  final List<String> paymentMethod = [
    Assets.imagesSVGRepoIconCarrier,
    Assets.imagesPaypal,
    Assets.imagesPayIos,
  ];
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                activeIndex = index;
                setState(() {});
              },
              child: PaymentMethodItem(
                image: paymentMethod[index],
                isActive: activeIndex == index,
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                width: 20,
              ),
          itemCount: paymentMethod.length),
    );
  }
}
