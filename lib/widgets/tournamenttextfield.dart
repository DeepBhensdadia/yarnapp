import 'package:flutter/material.dart';
import 'package:yarn_modified/constcolor.dart';

import '../const/themes.dart';
import '../cricketscreens/model/gettournamenttype.dart';

class TournamentTextFormField extends StatefulWidget {
  final String? Function(String?)? validatorfield;
  final void Function(String)? onchange;
  final void Function()? ontap;

  final bool read;

  const TournamentTextFormField({
    super.key,
    this.controller,
    this.labelText,
    this.keyboardType,
    this.hintText,
    this.InputAction,
    this.validatorfield,
    this.onchange,
    this.ontap,
    this.read = false,
  });

  final String? labelText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? InputAction;
  final String? hintText;

  @override
  State<TournamentTextFormField> createState() =>
      _TournamentTextFormFieldState();
}

class _TournamentTextFormFieldState extends State<TournamentTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Align(
          alignment: AlignmentDirectional.topStart,
          child: Text(
            widget.labelText ?? "",
            textScaleFactor: 1.3,
            style: TextStyle(fontWeight: FontWeight.w500, color: kthemecolor),
          ),
        ),
        SizedBox(
          height: 2,
        ),
        TextFormField(
          readOnly: widget.read,
          textCapitalization: TextCapitalization.words,
          onChanged: widget.onchange,
          onTap: widget.ontap,
          validator: widget.validatorfield,
          autocorrect: false,
          textAlign: TextAlign.start,
          cursorColor: Colors.black,
          textInputAction: widget.InputAction,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          style: TextStyle(
            color: widget.read ? Colors.black45 : Colors.black,
            fontSize: MediaQuery.of(context).textScaleFactor * 15,
          ),
          maxLength: 25,
          decoration: InputDecoration(
            counter: Offstage(),
            // hintText: widget.hintText,
            // hintStyle: TextStyle(
            //   color: Colors.grey,
            //   fontSize: MediaQuery.of(context).textScaleFactor * 13,
            // ),
            contentPadding: EdgeInsets.symmetric(horizontal: 0),
            disabledBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.black.withOpacity(0.5), width: 0.25),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.black.withOpacity(0.5), width: 0.25),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.blue.withOpacity(0.5), width: 1),
            ),
            border: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.black.withOpacity(0.5), width: 1),
            ),
          ),
        ),
      ],
    );
  }
}

class TournamentDropdown extends StatefulWidget {
  final String? lable;

  final List<DropdownMenuItem<String>>? count;

  final void Function(String?)? onchange;

  final String? Function(String?)? validator;

  const TournamentDropdown(
      {super.key, this.lable, this.count, this.validator, this.onchange});

  @override
  State<TournamentDropdown> createState() => _TournamentDropdownState();
}

class _TournamentDropdownState extends State<TournamentDropdown> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.topStart,
          child: Text(
            widget.lable ?? "",
            textScaleFactor: 1.3,
            style: TextStyle(
                fontWeight: FontWeight.w500, color: MyTheme.appBarColor),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          // height: 40,
          child: Theme(
            data: ThemeData(
                canvasColor: Colors.white,
                primaryColor: Colors.grey,
                accentColor: Colors.grey,
                hintColor: Colors.grey,
                colorScheme: ColorScheme.dark()),
            child: DropdownButtonFormField<String>(
              validator: widget.validator,
              onChanged: widget.onchange,
              icon: Icon(
                Icons.arrow_drop_down,
                color: Colors.grey,
              ),
              decoration: InputDecoration(
                // enabled: false,
                isDense: true,
                disabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black.withOpacity(0.5), width: 0.25),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black.withOpacity(0.5), width: 0.25),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black.withOpacity(0.5), width: 0.25),
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black.withOpacity(0.5), width: 0.25),
                ),
                floatingLabelAlignment: FloatingLabelAlignment.center,
              ),
              style: TextStyle(
                color: Colors.black,
                fontSize: MediaQuery.of(context).textScaleFactor * 13.5,
              ),
              // value: sub_Category_Data.first!.catId,
              items: widget.count,
            ),
          ),
        )
      ],
    );
  }
}
