import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:paymentapp/core/utils/api_kays.dart';
import 'package:paymentapp/core/widgets/custom_button.dart';
import 'package:paymentapp/features/checkout/data/models/amount_model/amount_model.dart';
import 'package:paymentapp/features/checkout/data/models/amount_model/details.dart';
import 'package:paymentapp/features/checkout/data/models/item_list_model/item.dart';
import 'package:paymentapp/features/checkout/data/models/item_list_model/item_list_model.dart';
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
            // PaymentIntentInputModel paymentIntentInputModel =
            //     const PaymentIntentInputModel(
            //         amount: '100',
            //         currency: 'USD',
            //         customerId: 'cus_QaV8EMsIvXQYwR');
            // BlocProvider.of<PaymentCubit>(context)
            //     .makePayment(paymentIntentInputModel: paymentIntentInputModel);
            var transactionData = getTransactionData();
            exauetPayPalPayment(context, transactionData);
          },
        );
      },
    );
  }

  void exauetPayPalPayment(BuildContext context,
      ({AmountModel amount, ItemListModel itemList}) transactionData) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: ApiKays.clientIdPaypal,
        secretKey: ApiKays.secretKeyPaypal,
        transactions: [
          {
            "amount": transactionData.amount.toJson(),
            "description": "The payment transaction description.",
            "item_list": transactionData.itemList.toJson(),
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          Navigator.pop(context);
        },
        onError: (error) {
          log("onError: $error");
          Navigator.pop(context);
        },
        onCancel: () {
          print('cancelled:');
          Navigator.pop(context);
        },
      ),
    ));
  }

  ({AmountModel amount, ItemListModel itemList}) getTransactionData() {
    var amount = AmountModel(
        currency: "USD",
        total: "100",
        details: Details(
          subtotal: "100",
          shipping: "0",
          shippingDiscount: 0,
        ));
    List<OrderItem> orders = [
      OrderItem(name: "Apple", quantity: 4, price: '10', currency: "USD"),
      OrderItem(name: "Pineapple", quantity: 5, price: '12', currency: "USD"),
    ];
    var itemListModel = ItemListModel(items: orders);

    return (amount: amount, itemList: itemListModel);
  }
}
