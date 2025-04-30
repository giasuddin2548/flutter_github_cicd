import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

//ignore: must_be_immutable
class ListItem extends StatelessWidget {
  final String corner;
  final String align;
  final String title;
  final double size;
  final Callback callback;
  final int position;

  ListItem({
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
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      // height: 50,
      width: size,
      decoration: BoxDecoration(
        // color: AppConstant.scaffoldColor(),
        // borderRadius: corner == 'left'
        //     ? BorderRadius.only(bottomLeft: Radius.circular(10))
        //     : corner == 'right'
        //         ? BorderRadius.only(bottomRight: Radius.circular(10))
        //         : BorderRadius.only(topLeft: Radius.circular(0)),
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color:
              title == 'Margin'
                  ? Theme.of(context).primaryColor.withOpacity(0.1)
                  : title == 'Non Margin'
                  ? Theme.of(context).primaryColorLight.withOpacity(0.2)
                  : Theme.of(context).cardColor,
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
              fontSize: 14,
              color:
                  title == 'Margin'
                      ? Theme.of(context).primaryColor
                      : title == 'Non Margin'
                      ? Theme.of(context).primaryColorLight
                      : Theme.of(context).hintColor,
            ),
          ),
        ),
      ),
    );
  }
}

class TaskRow extends StatelessWidget {
  final int item;
  final String align;
  final double size;

  TaskRow({required this.item, required this.align, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment:
          align == 'left'
              ? Alignment.centerLeft
              : align == 'right'
              ? Alignment.centerRight
              : Alignment.center,
      padding: const EdgeInsets.only(left: 5, right: 5),
      height: 40,
      width: size,
      child: FittedBox(
        child: Row(
          children: List.generate(
            item,
            (index) => CircleAvatar(
              radius: 15,
              backgroundColor: Colors.grey[400],
              // margin: const EdgeInsets.symmetric(horizontal: 2),
            ),
          ),
        ),
      ),
    );
  }
}

class ListItemAction extends StatelessWidget {
  final String corner;
  final String align;
  final String title;
  final double size;
  final Callback callback;
  final Callback callback2;
  final int position;

  ListItemAction({
    required this.corner,
    required this.align,
    required this.title,
    required this.size,
    required this.position,
    required this.callback,
    required this.callback2,
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
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      // height: 50,
      width: size,
      decoration: BoxDecoration(
        // color: AppConstant.scaffoldColor(),
        // borderRadius: corner == 'left'
        //     ? BorderRadius.only(bottomLeft: Radius.circular(10))
        //     : corner == 'right'
        //         ? BorderRadius.only(bottomRight: Radius.circular(10))
        //         : BorderRadius.only(topLeft: Radius.circular(0)),
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color:
              title == 'Margin'
                  ? Theme.of(context).primaryColor.withOpacity(0.1)
                  : title == 'Non Margin'
                  ? Theme.of(context).primaryColorLight.withOpacity(0.2)
                  : Theme.of(context).cardColor,
        ),
        child: Row(
          children: [
            IconButton(onPressed: callback, icon: Icon(Icons.edit)),
            IconButton(onPressed: callback2, icon: Icon(Icons.delete)),
          ],
        ),
      ),
    );
  }
}
