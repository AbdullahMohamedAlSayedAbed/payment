import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:paymentapp/core/utils/api_kays.dart';
import 'package:paymentapp/core/utils/api_service.dart';
import 'package:paymentapp/features/checkout/data/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:paymentapp/features/checkout/data/models/init_payment_sheet_input_model.dart';
import 'package:paymentapp/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:paymentapp/features/checkout/data/models/payment_intent_model/payment_intent_model.dart';

class StripeService {
  final ApiService apiService = ApiService();
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiService.post(
        contentType: Headers.formUrlEncodedContentType,
        url: 'https://api.stripe.com/v1/payment_intents',
        body: paymentIntentInputModel.toJson(),
        token: ApiKays.secretKey);

    return PaymentIntentModel.fromJson(response.data);
  }

  Future initPaymentSheet(
      {required InitPaymentSheetInputModel initPaymentSheetInput}) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
      customerEphemeralKeySecret: initPaymentSheetInput.ephemeralKey,
      customerId: initPaymentSheetInput.customerId,
      merchantDisplayName: 'Abdullah',
      paymentIntentClientSecret:
          initPaymentSheetInput.paymentIntentClientSecret,
    ));
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    var ephemeralKeyModel = await createEphemeralKey(
      customerId: paymentIntentInputModel.customerId,
    );
    var initPaymentSheetInputModel = InitPaymentSheetInputModel(
        customerId: paymentIntentInputModel.customerId,
        paymentIntentClientSecret: paymentIntentModel.clientSecret!,
        ephemeralKey: ephemeralKeyModel.secret!);
    await initPaymentSheet(initPaymentSheetInput: initPaymentSheetInputModel);
    await displayPaymentSheet();
  }

  Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerId}) async {
    var response = await apiService.post(
        contentType: Headers.formUrlEncodedContentType,
        url: 'https://api.stripe.com/v1/ephemeral_keys',
        body: {'customer': customerId},
        headers: {
          "Authorization": "Bearer ${ApiKays.secretKey}",
          "Stripe-Version": "2024-06-20"
        },
        token: ApiKays.secretKey);

    return EphemeralKeyModel.fromJson(response.data);
  }
}
