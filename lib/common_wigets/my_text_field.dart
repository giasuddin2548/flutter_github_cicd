import 'package:flutter/material.dart';
import 'package:flutter_github_cicd/utils/app_constent.dart';
import 'package:sizer/sizer.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController editingController;
  final bool enableOrDisable;
  final String hints;
  final String errorMessage;
  final TextInputType inputType;
  final bool isRequired;
  final Function(String)? onChangedCallback;

  const MyTextField({super.key, 
    required this.editingController,
    required this.enableOrDisable,
    required this.hints,
    required this.errorMessage,
    required this.inputType,
    required this.isRequired,
    this.onChangedCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 40,
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: TextFormField(
        enabled: enableOrDisable,
        keyboardType: inputType,
        style: TextStyle(
          fontSize: 14,
          // color: enableOrDisable == false
          //     ? Colors.black.withOpacity(0.5)
          //     : Colors.black,
        ),
        cursorColor: AppConstant.mySecondaryColor(),
        controller: editingController,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(
            vertical: 1.3.h,
            horizontal: 2.0.w,
          ),
          errorStyle: TextStyle(
            inherit: false,
            color: Colors.red,
            fontSize: 8.sp,
            height: 0.01.h,
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          fillColor: Theme.of(context).cardColor,
          // filled: true,
          hintText: hints,
          labelStyle: TextStyle(fontSize: 14),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.3),
              width: 1.0,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.3),
              width: 1.0,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          border: const OutlineInputBorder(),
          // prefixIcon: Icon(
          //   Icons.phone_android,
          //   color: AppConstant.mySecondaryColor(),
          //   size: 18,
          // ),
          // contentPadding:
          //     const EdgeInsets.only(top: 0, left: 15),
          // label: Text('Email or Mobile No.', style: TextStyle(color: AppConstant.mySecondaryColor(), fontSize: 15),),
        ),
        onChanged: (value) {
          onChangedCallback!(value);
        },
        validator: (value) {
          if (isRequired == true && (value == null || value.isEmpty)) {
            return errorMessage;
          }
          return null;
        },
      ),
    );
  }
}

class MyTextFieldd extends StatelessWidget {
  final TextEditingController editingController;
  final bool enableOrDisable;
  final String hints;
  final String errorMessage;
  final TextInputType inputType;
  final bool isRequired;
  final Function(String)? onChangedCallback;

  const MyTextFieldd({super.key, 
    required this.editingController,
    required this.enableOrDisable,
    required this.hints,
    required this.errorMessage,
    required this.inputType,
    required this.isRequired,
    this.onChangedCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 40,
      // margin: const EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        enabled: enableOrDisable,
        keyboardType: inputType,
        style: TextStyle(
          fontSize: 14,
          // color: enableOrDisable == false
          //     ? Colors.black.withOpacity(0.5)
          //     : Colors.black,
        ),
        cursorColor: AppConstant.mySecondaryColor(),
        controller: editingController,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(
            vertical: 1.3.h,
            horizontal: 2.0.w,
          ),
          // errorStyle: TextStyle(
          //   inherit: false,
          //   color: Colors.red,
          //   fontSize: 8.sp,
          //   height: 0.01.h,
          // ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),

          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          fillColor: Theme.of(context).cardColor,
          // filled: true,
          hintText: hints,
          labelStyle: TextStyle(fontSize: 14),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.3),
              width: 1.0,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.3),
              width: 1.0,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),

          border: const OutlineInputBorder(),
          // prefixIcon: Icon(
          //   Icons.phone_android,
          //   color: AppConstant.mySecondaryColor(),
          //   size: 18,
          // ),
          // contentPadding:
          //     const EdgeInsets.only(top: 0, left: 15),
          // label: Text('Email or Mobile No.', style: TextStyle(color: AppConstant.mySecondaryColor(), fontSize: 15),),
        ),
        onChanged: (value) {
          onChangedCallback?.call(value);
        },
        validator: (value) {
          if (isRequired == true && (value == null || value.isEmpty)) {
            return errorMessage;
          }
          return null;
        },
      ),
    );
  }
}

class MyTextFielPass extends StatelessWidget {
  final TextEditingController editingController;
  final bool enableOrDisable;
  final String hints;
  final String errorMessage;
  final TextInputType inputType;
  final bool isRequired;
  final bool obscureText;
  final Widget widget;
  final Function(String)? onChangedCallback;

  const MyTextFielPass({super.key, 
    required this.editingController,
    required this.enableOrDisable,
    required this.hints,
    required this.errorMessage,
    required this.inputType,
    required this.isRequired,
    required this.obscureText,
    required this.widget,
    this.onChangedCallback,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      // margin: const EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        obscureText: obscureText,
        enabled: enableOrDisable,
        keyboardType: inputType,
        style: TextStyle(
          fontSize: 14,
          // color: enableOrDisable == false
          //     ? Colors.black.withOpacity(0.5)
          //     : Colors.black,
        ),
        cursorColor: AppConstant.mySecondaryColor(),
        controller: editingController,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(
            vertical: 1.3.h,
            horizontal: 2.0.w,
          ),
          errorStyle: TextStyle(
            inherit: false,
            color: Colors.red,
            fontSize: 8.sp,
            height: 0.01.h,
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),

          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          fillColor: Theme.of(context).cardColor,
          // filled: true,
          hintText: hints,
          labelStyle: TextStyle(fontSize: 14),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.3),
              width: 1.0,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.3),
              width: 1.0,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),

          border: const OutlineInputBorder(),
          suffixIcon: widget,
          // prefixIcon: Icon(
          //   Icons.phone_android,
          //   color: AppConstant.mySecondaryColor(),
          //   size: 18,
          // ),
          // contentPadding:
          //     const EdgeInsets.only(top: 0, left: 15),
          // label: Text('Email or Mobile No.', style: TextStyle(color: AppConstant.mySecondaryColor(), fontSize: 15),),
        ),
        validator: (value) {
          if (isRequired == true && (value == null || value.isEmpty)) {
            return errorMessage;
          }
          return null;
        },
      ),
    );
  }
}

class MyTextFieldOnChanged extends StatelessWidget {
  TextEditingController editingController;
  bool enableOrDisable;
  String hints;
  String errorMessage;
  Icon icon;
  TextInputType inputType;
  bool isRequired;
  Function(String v) onChanged;

  MyTextFieldOnChanged({super.key, 
    required this.editingController,
    required this.enableOrDisable,
    required this.hints,
    required this.errorMessage,
    required this.icon,
    required this.inputType,
    required this.isRequired,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      height: 70,
      margin: EdgeInsets.only(left: 10, right: 10),
      child: TextFormField(
        enabled: enableOrDisable,
        keyboardType: inputType,
        style: TextStyle(
          fontSize: 14,
          color:
              enableOrDisable == false
                  ? Colors.grey
                  : AppConstant.mySecondaryColor(),
        ),
        cursorColor: AppConstant.mySecondaryColor(),
        controller: editingController,

        decoration: InputDecoration(
          errorStyle: TextStyle(fontSize: 11.0, color: Colors.red),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),

          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          fillColor: AppConstant.scaffoldColor(),
          filled: true,
          hintText: hints,
          labelStyle: TextStyle(fontSize: 14),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppConstant.myMainColor(),
              width: 1.0,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppConstant.mySecondaryColor(),
              width: 1.0,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),

          border: OutlineInputBorder(),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          prefixIcon: icon,
          contentPadding: EdgeInsets.only(top: 0, left: 5),

          // label: Text('Email or Mobile No.', style: TextStyle(color: AppConstant.mySecondaryColor(), fontSize: 15),),
        ),
        onChanged: onChanged,
        // validator: (v){
        //   final _number = _controller.etCInvestorSurrenderPriceUnit.text;
        //   if(isRequired==true){
        //     if (v!.isEmpty)
        //       return errorMessage;
        //   }else{
        //     return null;
        //   }
        //
        //
        //   return null;
        // },
      ),
    );
  }
}

class MyTextFieldFileChose extends StatelessWidget {
  final TextEditingController editingController;
  final bool enableOrDisable;
  final String hints;
  final String errorMessage;
  final TextInputType inputType;
  final bool isRequired;
  final Function(String)? onChangedCallback;

  const MyTextFieldFileChose({super.key, 
    required this.editingController,
    required this.enableOrDisable,
    required this.hints,
    required this.errorMessage,
    required this.inputType,
    required this.isRequired,
    this.onChangedCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: TextFormField(
        enabled: enableOrDisable,
        keyboardType: inputType,
        style: TextStyle(
          fontSize: 14,
          color:
              enableOrDisable == false
                  ? Colors.black.withOpacity(0.5)
                  : Colors.black,
        ),
        cursorColor: AppConstant.myMainColor(),
        controller: editingController,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(
            vertical: 1.3.h,
            horizontal: 2.0.w,
          ),
          errorStyle: TextStyle(
            inherit: false,
            color: Colors.red,
            fontSize: 8.sp,
            height: 0.01.h,
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),

          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          fillColor: Theme.of(context).cardColor,
          // filled: true,
          labelStyle: TextStyle(fontSize: 14),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.3),
              width: 1.0,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.3),
              width: 1.0,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          hintText: hints,
          border: const OutlineInputBorder(),
          // prefixIcon: Icon(
          //   Icons.phone_android,
          //   color: AppConstant.mySecondaryColor(),
          //   size: 18,
          // ),
          // contentPadding:
          //     const EdgeInsets.only(top: 0, left: 15),
          // label: Text('Email or Mobile No.', style: TextStyle(color: AppConstant.mySecondaryColor(), fontSize: 15),),
        ),
        onChanged: (value) {
          onChangedCallback!(value);
        },
      ),
    );
  }
}
