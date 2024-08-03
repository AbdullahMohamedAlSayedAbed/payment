import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paymentapp/core/utils/app_images.dart';
import 'package:paymentapp/features/checkout/presentation/manger/cubit/payment_cubit.dart';
import 'package:paymentapp/features/checkout/presentation/widgets/payment_method_item.dart';

class PaymentMethodsListView extends StatelessWidget {
  const PaymentMethodsListView({super.key});
  static const List<String> paymentMethod = [
    Assets.imagesSVGRepoIconCarrier,
    Assets.imagesPaypal,
    Assets.imagesPayIos,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return BlocBuilder<PaymentCubit, PaymentState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () {
                    BlocProvider.of<PaymentCubit>(context).choicePayment(index);
                  },
                  child: PaymentMethodItem(
                    image: paymentMethod[index],
                    isActive:
                        BlocProvider.of<PaymentCubit>(context).choiceIndex ==
                            index,
                  ),
                );
              },
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                width: 20,
              ),
          itemCount: paymentMethod.length),
    );
  }
}
