import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../const/themes.dart';

//=============================================================================
//===================Common TextField Login/Forgot Password====================

class CommonTextField extends StatefulWidget {
  const CommonTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.keyboardType,
    required this.hintText,
    required this.inputFormatters
  });

  final String labelText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String hintText;
  final FilteringTextInputFormatter inputFormatters;

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.topStart,
          child: Text(
            widget.labelText,
            textScaleFactor: 1.3,
            style: TextStyle(fontWeight: FontWeight.w500, color: MyTheme.appBarColor),
          ),
        ),
        SizedBox(height: 2,),
        TextFormField(
          textCapitalization: TextCapitalization.words,
          autocorrect: false,
          textAlign: TextAlign.start,
          cursorColor: Colors.black,
          textInputAction: TextInputAction.next,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          style: TextStyle(
            color: Colors.black,
            fontSize: MediaQuery.of(context).textScaleFactor * 15,
          ),
          inputFormatters: [widget.inputFormatters],
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: MediaQuery.of(context).textScaleFactor * 13,
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 0,
            ),
            disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black.withOpacity(0.5),width: 0.25),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black.withOpacity(0.5),width: 0.25),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue.withOpacity(0.5),width: 1),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black.withOpacity(0.5),width: 1),
            ),
            // focusedBorder: UnderlineInputBorder(
            //   borderSide: BorderSide.none,
            //   borderRadius: BorderRadius.circular(15),
            // ),
            // border: UnderlineInputBorder(
            //   borderSide: BorderSide.none,
            //   borderRadius: BorderRadius.all(Radius.circular(15)),
            // ),
          ),
        ),
      ],
    );
  }
}

//=============================================================================
//===================Common Mobile TextField Login/Forgot Password====================

class CommonMobileTextField extends StatefulWidget {
  const CommonMobileTextField({super.key,
    required this.controller,
    required this.labelText,
    required this.hintText});

  final String labelText;
  final TextEditingController controller;
  final String hintText;

  @override
  State<CommonMobileTextField> createState() => _CommonMobileTextFieldState();
}

class _CommonMobileTextFieldState extends State<CommonMobileTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.topStart,
          child: Text(
            widget.labelText,
            textScaleFactor: 1.3,
            style: TextStyle(fontWeight: FontWeight.w500, color: MyTheme.appBarColor),
          ),
        ),
        SizedBox(height: 2,),
        TextFormField(
          textCapitalization: TextCapitalization.words,

          autocorrect: false,
          textAlign: TextAlign.start,
          cursorColor: Colors.black,
          textInputAction: TextInputAction.next,
          controller: widget.controller,
          keyboardType: TextInputType.numberWithOptions(decimal: false),
          style: TextStyle(
            color: Colors.black,
            fontSize: MediaQuery.of(context).textScaleFactor * 15,
          ),
          maxLength: 10,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            FilteringTextInputFormatter.deny(RegExp('[\\.]')),
          ],
          decoration: InputDecoration(
            counter: Offstage(),
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: MediaQuery.of(context).textScaleFactor * 13,
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 0,
            ),
            disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black.withOpacity(0.5),width: 0.25),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black.withOpacity(0.5),width: 0.25),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue.withOpacity(0.5),width: 1),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black.withOpacity(0.5),width: 1),
            ),
          ),
        ),
      ],
    );
  }
}

//=============================================================================
//=========================Glowing ListView Effect===========================

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

//=============================================================================
//===================Common TextField====================

class CommonTextFormField extends StatefulWidget {
  final String? Function(String?)? validatorfield;

  const CommonTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.keyboardType,
    required this.hintText,
    required this.InputAction, this.validatorfield,
  });

  final String labelText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction InputAction;
  final String hintText;

  @override
  State<CommonTextFormField> createState() => _CommonTextFormFieldState();
}

class _CommonTextFormFieldState extends State<CommonTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.topStart,
          child: Text(
            widget.labelText,
            textScaleFactor: 1.3,
            style: TextStyle(fontWeight: FontWeight.w500, color: MyTheme.appBarColor),
          ),
        ),
        SizedBox(height: 2,),
        TextFormField(
          textCapitalization: TextCapitalization.words,

          validator: widget.validatorfield,
          autocorrect: false,
          textAlign: TextAlign.start,
          cursorColor: Colors.black,
          textInputAction: widget.InputAction,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          style: TextStyle(
            color: Colors.black,
            fontSize: MediaQuery.of(context).textScaleFactor * 15,
          ),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: MediaQuery.of(context).textScaleFactor * 13,
            ),
            contentPadding: EdgeInsets.symmetric(
                horizontal: 0
            ),
            disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black.withOpacity(0.5),width: 0.25),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black.withOpacity(0.5),width: 0.25),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue.withOpacity(0.5),width: 1),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black.withOpacity(0.5),width: 1),
            ),
          ),
        ),
      ],
    );
  }
}

//=============================================================================
//===================Common Decimal Numbers TextField====================

class CommonDecimalTextField extends StatefulWidget {
  final String? Function(String?)? validatorfield;
  const CommonDecimalTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.keyboardType,
    required this.hintText,
    required this.InputAction, this.validatorfield,
  });

  final String labelText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction InputAction;
  final String hintText;

  @override
  State<CommonDecimalTextField> createState() => _CommonDecimalTextFieldState();
}

class _CommonDecimalTextFieldState extends State<CommonDecimalTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.topStart,
          child: Text(
            widget.labelText,
            textScaleFactor: 1.3,
            style: TextStyle(fontWeight: FontWeight.w500, color: MyTheme.appBarColor),
          ),
        ),
        SizedBox(height: 2,),
        TextFormField(
          textCapitalization: TextCapitalization.words,
          validator: widget.validatorfield,
          autocorrect: false,
          textAlign: TextAlign.start,
          cursorColor: Colors.black,
          textInputAction: widget.InputAction,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          style: TextStyle(
            color: Colors.black,
            fontSize: MediaQuery.of(context).textScaleFactor * 15,
          ),
          inputFormatters: [
            FilteringTextInputFormatter.deny(RegExp('[\\-,\b]')),
          ],
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: MediaQuery.of(context).textScaleFactor * 13,
            ),
            contentPadding: EdgeInsets.symmetric(
                horizontal: 0
            ),
            disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black.withOpacity(0.5),width: 0.25),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black.withOpacity(0.5),width: 0.25),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue.withOpacity(0.5),width: 1),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black.withOpacity(0.5),width: 1),
            ),
          ),
        ),
      ],
    );
  }
}


