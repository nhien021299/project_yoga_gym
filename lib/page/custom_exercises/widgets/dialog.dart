import 'package:flutter/material.dart';

class DialogWidget extends StatelessWidget {
  final String title;
  final Widget? widget;
  final Function() onSubmitClicked;
  final Function() onCancel;

  const DialogWidget({
    Key? key,
    this.widget,
    required this.onSubmitClicked,
    required this.onCancel,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(24),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 32),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Color(0xFF252525),
              ),
            ),
          ),
          widget ?? Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Color(0xFFF5F5F5),
                      ),
                      right: BorderSide(
                        color: Color(0xFFF5F5F5),
                      ),
                    ),
                  ),
                  child: TextButton(
                    onPressed: onCancel,
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(24),
                        ),
                      ),
                    ),
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF909090),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Color(0xFFF5F5F5),
                      ),
                    ),
                  ),
                  child: TextButton(
                    onPressed: onSubmitClicked,
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(24),
                        ),
                      ),
                    ),
                    child: Text(
                      "Confirm",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF673AB7),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
