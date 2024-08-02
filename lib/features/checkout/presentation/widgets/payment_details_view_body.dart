import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:paymentapp/core/widgets/custom_button.dart';
import 'package:paymentapp/features/checkout/presentation/views/thank_you_view.dart';
import 'custom_credit_card.dart';
import 'payment_methods_list_view.dart';

class PaymentDetailsViewBody extends StatefulWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 18),
                PaymentMethodsListView(),
                SizedBox(height: 30),
              ],
            ),
          ),
          SliverToBoxAdapter(
              child: CustomCreditCard(
            autovalidateMode: autovalidateMode,
            formKey: formKey,
          )),
          SliverFillRemaining(
              hasScrollBody: false,
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomButton(
                          name: 'Pay',
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              log("form is valid");
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (_) {
                                return const ThankYouView();
                              }));
                            } else {
                              autovalidateMode = AutovalidateMode.always;
                              setState(() {});
                            }
                          }),
                      const SizedBox(height: 12),
                    ],
                  ))),
        ],
      ),
    );
  }
}
