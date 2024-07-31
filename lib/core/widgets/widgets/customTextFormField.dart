// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:graduation_project/core/config/theme.dart';

class DefaultTextFormField extends StatefulWidget {
  const DefaultTextFormField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.validator,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.maxLength,
  });

  final String hintText;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final bool isPassword;
  final int? maxLength;

  @override
  State<DefaultTextFormField> createState() => _DefaultTextFormFieldState();
}

class _DefaultTextFormFieldState extends State<DefaultTextFormField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: AppTheme.white,
        filled: true,
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () => setState(() => isObscure = !isObscure),
                icon: isObscure
                    ? const Icon(Icons.visibility_outlined)
                    : const Icon(Icons.visibility_off_outlined),
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppTheme.primaryLight),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppTheme.primaryLight),
          borderRadius: BorderRadius.circular(15),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppTheme.primaryLight),
          borderRadius: BorderRadius.circular(15),
        ),
        hintText: widget.hintText,
        hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: AppTheme.grey,
            ),
      ),
      style: TextStyle(
        color: AppTheme.black,
      ),
      validator: widget.validator,
      controller: widget.controller,
      obscureText: widget.isPassword ? isObscure : false,
      keyboardType: widget.keyboardType,
      maxLength: widget.maxLength,
    );
  }
}

// ignore: must_be_immutable
// class customTextFormField extends StatefulWidget {
//   String? hintText;
//   bool? obsecureText;
//   Function(String)? onFieldSubmitted;
//   customTextFormField({
//     Key? key,
//     required this.hintText,
//     this.obsecureText= false,
//     this.onFieldSubmitted,
//   }) : super(key: key);

//   @override
//   State<customTextFormField> createState() => _customTextFormFieldState();
// }

// class _customTextFormFieldState extends State<customTextFormField> {
//   bool showPassword = false;
//    void toggleShowPassword() {
//     setState(() {
//       showPassword = !showPassword;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       obscureText: !showPassword,
//       validator: (data){
//         if(data!.isEmpty){
//           return 'this field is required';
//         }
//         return null;
//       },
//       onFieldSubmitted: widget.onFieldSubmitted ,
//       decoration: InputDecoration(
//         fillColor: const Color.fromRGBO(230, 230, 230, 0.537),
//         filled: true,
//         hintText:widget.hintText,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(20.0),
//           borderSide: BorderSide(
//             width: 4.0,
//             color: AppTheme.primaryLight,
//           ),
//         ),
//       ),
//     );
//   }
// }

// // ignore: must_be_immutable
// class customTextFormFieldPassword extends StatefulWidget {
//   bool? isPassword = false;
//   String? hintText;
//   bool? obsecureText;
//   Function(String)? onFieldSubmitted;
//   customTextFormFieldPassword({
//     Key? key,
//     this.isPassword,
//     required this.hintText,
//     this.obsecureText= false,
//     this.onFieldSubmitted,
//   }) : super(key: key);

//   @override
//   State<customTextFormFieldPassword> createState() => _customTextFormFieldPasswordState();
// }

// class _customTextFormFieldPasswordState extends State<customTextFormFieldPassword> {
//   bool showPassword = false;
//    void toggleShowPassword() {
//     setState(() {
//       showPassword = !showPassword;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       obscureText: !showPassword,
//       validator: (data){
//         if(data!.isEmpty){
//           return 'this field is required';
//         }
//         return null;
//       },
//       onFieldSubmitted: widget.onFieldSubmitted ,
//       decoration: InputDecoration(
//         suffixIcon: IconButton(onPressed: toggleShowPassword, icon:showPassword? Icon(Icons.visibility):Icon(Icons.visibility_off)),
//         fillColor: const Color.fromRGBO(230, 230, 230, 0.537),
//         filled: true,
//         hintText:widget.hintText,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(20.0),
//           borderSide: BorderSide(
//             width: 4.0,
//             color: AppTheme.primaryLight,
//           ),
//         ),
//       ),
//     );
//   }
// }
