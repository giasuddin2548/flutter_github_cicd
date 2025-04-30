import 'package:flutter/material.dart';

class FormHeader extends StatelessWidget {
  String title;
  bool? required;

  FormHeader({required this.title, this.required = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.yellow,
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 3),
      alignment: Alignment.centerLeft,
      height: 20,
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              color: Theme.of(context).hintColor,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 2),
          required == false
              ? Container()
              : Text(
                '*',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ],
      ),
    );
  }
}
