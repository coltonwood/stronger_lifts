import 'package:flutter/material.dart';

class CustomTextInput extends StatelessWidget {
  const CustomTextInput({
    Key key,
    @required this.hint,
    this.validator,
    this.secure = false,
    this.inputAction = TextInputAction.next,
  });

  final String hint;
  final Function validator;
  final bool secure;
  final TextInputAction inputAction;

  @override
  Widget build(BuildContext context) {
    var _controller = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: _controller,
          textInputAction: inputAction,
          obscureText: secure,
          decoration: InputDecoration(
            // label styling
            labelText: hint,
            labelStyle: TextStyle(
              fontSize: 24,
              color: Colors.grey,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            // border styling
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.blue,
                width: 2.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.grey[400],
                width: 2.0,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.red,
                width: 2.0,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.red,
                width: 2.0,
              ),
            ),
            border: InputBorder.none,
          ),
          validator: validator,
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
