import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

//ignore: must_be_immutable
class ListHeader extends StatelessWidget {
  final String corner;
  final String align;
  final String title;
  final double size;
  final Callback callback;
  final int position;
  final Color color;
  final double height;

  const ListHeader({super.key, 
    required this.corner,
    required this.align,
    required this.title,
    required this.size,
    required this.position,
    required this.callback,
    required this.color,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment:
          align == 'left'
              ? Alignment.centerLeft
              : align == 'right'
              ? Alignment.centerRight
              : Alignment.center,
      padding: EdgeInsets.only(left: 10, right: 10),
      height: height,
      width: size,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Theme.of(context).hintColor, width: 0.2),
        ),
        // color: color,
        // borderRadius: corner == 'left'
        //     ? BorderRadius.only(topLeft: Radius.circular(10))
        //     : corner == 'right'
        //         ? BorderRadius.only(topRight: Radius.circular(10))
        //         : BorderRadius.only(topLeft: Radius.circular(0)),
      ),
      child: InkWell(
        onTap: callback,
        child: Text(
          title,
          textAlign:
              align == 'left'
                  ? TextAlign.left
                  : align == 'right'
                  ? TextAlign.right
                  : TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).hintColor,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
