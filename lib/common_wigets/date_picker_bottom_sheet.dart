import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'list_item_actions.dart';

//ignore: must_be_immutable
class DatePickerBottomSheet extends StatelessWidget {
  var dateNow = DateTime.now();
  var dateNow1 = DateTime.now();
  TextEditingController editingController;
  String title;

  DatePickerBottomSheet({required this.editingController, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.size.width,
      height: 40 / 100 * Get.size.height,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),

      child: Column(
        children: [
          Container(
            // color: Colors.red,
            margin: const EdgeInsets.only(
              left: 10,
              right: 10,
              top: 3,
              bottom: 3,
            ),
            height: 5 / 100 * Get.size.height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ListItemActions(
                  corner: 'dfd',
                  align: 'ss',
                  title: 'Cancel',
                  size: 20 / 100 * Get.size.width,
                  position: 1,
                  callback: () {
                    Get.back();
                  },
                ),

                SizedBox(
                  width: 40 / 100 * Get.size.width,
                  child: Center(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                ListItemActions(
                  corner: 'dfd',
                  align: 'ss',
                  title: 'Confirm',
                  size: 30 / 100 * Get.size.width,
                  position: 1,
                  callback: () {
                    String formattedDate = DateFormat(
                      'yyyy-MM-dd',
                    ).format(dateNow1);
                    editingController.text = formattedDate;
                    Get.back();
                    print('ffffff: ${editingController.text}');
                  },
                ),
              ],
            ),
          ),
          Divider(height: 1, color: Colors.grey.withOpacity(0.2)),
          SizedBox(
            // color: Colors.yellow,
            height: 20 / 100 * Get.size.height,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: dateNow,
              onDateTimeChanged: (DateTime newDateTime) {
                dateNow1 = newDateTime;
              },
            ),
          ),
        ],
      ),
    );
  }
}
