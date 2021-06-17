import 'package:flutter/material.dart';

class InputWidget extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType inputType;
  final Function onFieldSubmitted;

  const InputWidget({
    Key key,
    this.controller,
    this.hintText,
    this.onFieldSubmitted,
    this.inputType,
  }) : super(key: key);

  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  bool _isEmpty = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: TextFormField(
        keyboardType: widget.inputType,
        controller: widget.controller,
        onFieldSubmitted: (value) => widget.onFieldSubmitted?.call(),
        onChanged: (value) {
          setState(
            () {
              _isEmpty = widget.controller.text.isEmpty;
            },
          );
        },
        textInputAction: TextInputAction.done,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFF673AB7)),
          ),
          enabledBorder: _isEmpty
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Color(0xFF909090)),
                )
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Color(0xFF673AB7)),
                ),
          alignLabelWithHint: true,
          focusColor: Color(0xFF673AB7),
          fillColor: Color(0xFF673AB7),
          hoverColor: Color(0xFF673AB7),
          labelText: widget.hintText,
          labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Color(0xFF909090)),
        ),
        cursorColor: Color(0xFF673AB7),
      ),
    );
  }
}
