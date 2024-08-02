import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:paymentapp/core/utils/api_kays.dart';
import 'package:paymentapp/features/checkout/presentation/views/my_cart_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = ApiKays.publicKey;
  runApp(const CheckoutApp());
}

class CheckoutApp extends StatelessWidget {
  const CheckoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyCartView(),
      theme: ThemeData(
        fontFamily: 'Inter',
      ),
    );
  }
}
