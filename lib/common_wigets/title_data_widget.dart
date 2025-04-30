import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TitleDataWidget extends StatelessWidget {
  String title;
  Widget data;
  String titleAlignment;
  String dataAlignment;
  bool? isRequired = false;

  TitleDataWidget({super.key, 
    required this.title,
    required this.data,
    required this.titleAlignment,
    required this.dataAlignment,
    this.isRequired,
  });
  var te = TextEditingController();

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
                width: 35 / 100 * Get.size.width,
                padding: const EdgeInsets.all(5),
                constraints: const BoxConstraints(minHeight: 40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                  ),
                  color: Theme.of(context).hintColor.withOpacity(.05),
                ),
                child: FittedBox(
                  child: Row(
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 15,
                          color: Theme.of(context).hintColor,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(width: 3),
                      isRequired == true
                          ? Text(
                            '*',
                            style: TextStyle(
                              fontSize: 15,
                              color: Theme.of(context).primaryColorLight,
                            ),
                            textAlign: TextAlign.left,
                          )
                          : Container(),
                    ],
                  ),
                ),
              ),

              //data
              Container(
                alignment:
                    dataAlignment == 'center'
                        ? Alignment.center
                        : dataAlignment == 'left'
                        ? Alignment.center
                        : Alignment.center,
                width: 70 / 100 * Get.size.width,

                margin: const EdgeInsets.only(left: 0),
                constraints: const BoxConstraints(minHeight: 40),
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.only(
                  //   topRight: Radius.circular(5),
                  //   bottomRight:  Radius.circular(5),
                  // ),
                  color: Theme.of(context).hintColor.withOpacity(.05),
                ),
                child: data,
                // child: Text(
                //   data,
                //   textAlign: dataAlignment=='center'? TextAlign.center:dataAlignment=='left'?TextAlign.left:TextAlign.right,
                //   style: TextStyle(fontSize: 15),
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
