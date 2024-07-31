import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: camel_case_types
class OTP_Form extends StatelessWidget {
  const OTP_Form({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: ShapeDecoration(
            color: Color(0xFFEFEFEF),
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Color(0xFFA5D6A7)),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: SizedBox(
            width: 59,
            height: 53,
            child: TextFormField(
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
          ),
        ),
        Container(
          decoration: ShapeDecoration(
            color: Color(0xFFEFEFEF),
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Color(0xFFA5D6A7)),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: SizedBox(
            width: 59,
            height: 53,
            child: TextFormField(
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
          ),
        ),
        Container(
          decoration: ShapeDecoration(
            color: Color(0xFFEFEFEF),
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Color(0xFFA5D6A7)),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: SizedBox(
            width: 59,
            height: 53,
            child: TextFormField(
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
          ),
        ),
        Container(
          decoration: ShapeDecoration(
            color: Color(0xFFEFEFEF),
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Color(0xFFA5D6A7)),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: SizedBox(
            width: 59,
            height: 53,
            child: TextFormField(
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
