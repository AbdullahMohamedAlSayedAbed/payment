import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paymentapp/core/widgets/custom_button.dart';
import 'package:paymentapp/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:paymentapp/features/checkout/presentation/manger/cubit/payment_cubit.dart';
import 'package:paymentapp/features/checkout/presentation/views/thank_you_view.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ThankYouView()));
        }

        if (state is PaymentError) {
          Navigator.pop(context);
          log(state.errMessage);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
            ),
          );
        }
      },
      builder: (context, state) {
        return CustomButton(
          name: 'Continue',
          isLoading: state is PaymentLoading,
          onPressed: () {
            PaymentIntentInputModel paymentIntentInputModel =
                const PaymentIntentInputModel(
                    amount: '100',
                    currency: 'USD',
                    customerId: 'cus_QaV8EMsIvXQYwR');
            BlocProvider.of<PaymentCubit>(context)
                .makePayment(paymentIntentInputModel: paymentIntentInputModel);
          },
        );
      },
    );
  }
}
