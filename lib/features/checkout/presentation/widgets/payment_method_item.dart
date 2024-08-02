import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem({
    super.key,
    this.isActive = false,
    required this.image,
  });
  final bool isActive;
  final String image;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 103,
      height: 62,
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(
                color: isActive ? const Color(0xff34A853) : Colors.grey,
                width: 1.5),
          ),
          shadows: [
            BoxShadow(
              color: isActive ? const Color(0xff34A853) : Colors.grey,
              spreadRadius: 0,
              blurRadius: 4,
              offset: const Offset(0, 0), // changes position of shadow
            ),
          ]),
      duration: const Duration(milliseconds: 500),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
            child: SvgPicture.asset(
          image,
          height: 30,
          fit: BoxFit.scaleDown,
        )),
      ),
    );
  }
}
