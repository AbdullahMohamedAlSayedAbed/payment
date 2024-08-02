import 'package:flutter/material.dart';
import 'package:paymentapp/features/checkout/presentation/widgets/payment_methods_list_view.dart';

import 'custom_button_bloc_consumer.dart';

class PaymentModelBottomSheet extends StatelessWidget {
  const PaymentModelBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 12),
          PaymentMethodsListView(),
          SizedBox(height: 32),
          CustomButtonBlocConsumer()
        ],
      ),
    );
  }
}
