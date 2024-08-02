import 'package:flutter/material.dart';
import 'package:paymentapp/core/utils/app_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.name,
      required this.onPressed,
      this.isLoading = false});
  final String name;
  final void Function() onPressed;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 73,
        width: double.infinity,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff34A853),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                )),
            onPressed: onPressed,
            child: isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                    color: Colors.black,
                  ))
                : Text(
                    name,
                    style: AppStyle.styleMedium22,
                  )));
  }
}
