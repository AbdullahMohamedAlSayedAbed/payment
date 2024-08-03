import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paymentapp/core/utils/app_images.dart';
import 'package:paymentapp/features/checkout/data/repos/check_repo_impl.dart';
import 'package:paymentapp/features/checkout/presentation/manger/cubit/payment_cubit.dart';

import '../../../../core/widgets/custom_button.dart';
import 'custom_divider.dart';
import 'order_info_item.dart';
import 'payment_model_bottom_sheet.dart';
import 'total_price.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 18),
          Expanded(child: Image.asset(Assets.imagesBasketImage)),
          const SizedBox(height: 25),
          const OrderInfoItem(title: 'Order Subtotal', price: r'$42.97'),
          const SizedBox(height: 3),
          const OrderInfoItem(title: 'Discount', price: r'$0'),
          const SizedBox(height: 3),
          const OrderInfoItem(title: 'Shipping', price: r'$8'),
          const CustomDivider(),
          const TotalPrice(
            price: r'$50.97',
            title: 'Total',
          ),
          const SizedBox(height: 16),
          CustomButton(
            name: 'Complete paymentapp',
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return BlocProvider(
                    create: (context) => PaymentCubit(CheckRepoImpl()),
                    child: const PaymentModelBottomSheet(),
                  );
                },
              );
              // Navigator.of(context).push(MaterialPageRoute(builder: (_) {
              //   return const PaymentDetailsView();
              // }));
            },
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
