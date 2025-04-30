import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

import '../utils/app_constent.dart';

class DashItemActions extends StatelessWidget {
  String title;
  String data;
  Callback callback;
  int position;

  DashItemActions({super.key, 
    required this.title,
    required this.data,
    required this.callback,
    required this.position,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: FittedBox(
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //title
              Container(
                alignment: Alignment.centerLeft,
                width: 30 / 100 * Get.size.width,
                padding: const EdgeInsets.all(5),
                constraints: const BoxConstraints(minHeight: 40),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                  ),
                  color: Color(0xffE6E4E4),
                ),
                child: Container(
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 15, color: Colors.black),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),

              //data
              InkWell(
                onTap: callback,
                child: Container(
                  alignment: Alignment.center,
                  width: 70 / 100 * Get.size.width,
                  constraints: const BoxConstraints(minHeight: 40),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                    color: Colors.white,
                  ),
                  child: Container(
                    width: 20 / 100 * Get.size.width,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppConstant.myMainColor(),
                        width: 1.2,
                      ),
                      borderRadius: BorderRadius.circular(180),
                    ),
                    child: Text(
                      data,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppConstant.myMainColor(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//ignore: must_be_immutable
class ListItemActions extends StatelessWidget {
  String corner;
  String align;
  String title;
  double size;
  Callback callback;
  int position;

  ListItemActions({super.key, 
    required this.corner,
    required this.align,
    required this.title,
    required this.size,
    required this.position,
    required this.callback,
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
      padding: EdgeInsets.only(left: 10),
      height: 35,
      width: size,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius:
            corner == 'left'
                ? BorderRadius.only(bottomLeft: Radius.circular(10))
                : corner == 'right'
                ? BorderRadius.only(bottomRight: Radius.circular(10))
                : BorderRadius.only(topLeft: Radius.circular(0)),
      ),
      child: InkWell(
        onTap: callback,
        child: Container(
          decoration: BoxDecoration(
            // color: Colors.red,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Theme.of(context).hintColor),
          ),

          child: Padding(
            padding: const EdgeInsets.only(
              top: 3,
              bottom: 3,
              right: 10,
              left: 10,
            ),
            child: Text(
              title,
              textAlign:
                  align == 'left'
                      ? TextAlign.left
                      : align == 'right'
                      ? TextAlign.right
                      : TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: Theme.of(context).hintColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
