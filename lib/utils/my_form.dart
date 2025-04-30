import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class MyForm {
  static Future<FormData> myFromMaker(Map<String, dynamic> map) async {
    return FormData.fromMap(map);
  }

  static Future<FormData> myFromMakerWithFile(
    Map<String, dynamic> map,
    File file,
  ) async {
    Map<String, dynamic> myProcessData = {};
    map.forEach((key, value) {
      myProcessData[key] = value;
    });
    myProcessData['deposit_slip'] = await MultipartFile.fromFile(file.path);
    //
    // debugPrint("My_From: $myProcessData");
    // // debugPrint("My_From: ${file.path}");

    return FormData.fromMap(myProcessData);
  }

  static Future<FormData> myFromMakerWithFileName(
    Map<String, dynamic> map,
    File file,
    String filename,
  ) async {
    Map<String, dynamic> myProcessData = {};
    map.forEach((key, value) {
      myProcessData[key] = value;
    });
    myProcessData[filename] = await MultipartFile.fromFile(file.path);
    //
    // debugPrint("My_From: $myProcessData");
    // // debugPrint("My_From: ${file.path}");

    return FormData.fromMap(myProcessData);
  }

  static Future<FormData> myFromMakerWithFile2(
    Map<String, dynamic> map,
    File file1,
    File file2,
    File file3,
    File file4,
  ) async {
    Map<String, dynamic> myProcessData = {};
    map.forEach((key, value) {
      myProcessData[key] = value;
    });
    myProcessData['investorProfileImage'] = await MultipartFile.fromFile(
      file1.path,
      filename: 'file1',
    );
    myProcessData['investorNidImage'] = await MultipartFile.fromFile(
      file2.path,
    );
    myProcessData['investorSignImage'] = await MultipartFile.fromFile(
      file3.path,
    );
    myProcessData['investorBoImage'] = await MultipartFile.fromFile(file4.path);
    //
    // debugPrint("My_From: $myProcessData");
    // // debugPrint("My_From: ${file.path}");

    return FormData.fromMap(myProcessData);
  }

  // Map<String, File> mapData={};
  // mapData["applicant_photo"]=fileNo1.value;
  // mapData["applicant_sign"]=fileNo2.value;
  // mapData["nid_copy"]=fileNo3.value;
  // mapData[ "tin"]=fileNo4.value;
  //
  //
  // if(jointAccount.value==true){
  // mapData["joint_applicant_photo"]=fileNo7.value;
  // mapData[ "joint_applicant_sign"]=fileNo8.value;
  // mapData["joint_tin"]=fileNo10.value;
  // }
  //
  //
  // mapData["nominee_applicant_photo"]=fileNo11.value;
  // mapData["nominee_applicant_sign"]=fileNo12.value;
  // mapData["nominee_nid_applicant_photo"]=fileNo13.value;

  // static Future<FormData> fileToMap({required Map<String, dynamic> map,required File file1, required File file2, required File file3, required File file4})async{
  //
  //   Map<String, dynamic> mapData={};
  //   map.forEach((key, value) {
  //     mapData[key]=value;
  //   });
  //   mapData["investorProfileImage"]=await MultipartFile.fromFile(file1.path, filename: 'file1');
  //   mapData["investorNidImage"]=await MultipartFile.fromFile(file2.path);
  //   mapData["investorSignImage"]=await MultipartFile.fromFile(file3.path);
  //   mapData[ "investorBoImage"]=await MultipartFile.fromFile(file4.path);
  //
  //
  //
  //   return FormData.fromMap(mapData);
  // }

  static Future<FormData> mapWithFile({
    required Map<String, dynamic> map,
    required File file1,
    required File file2,
    required File file3,
    required File file4,
  }) async {
    Map<String, dynamic> data = {};
    data.addAll(map);
    debugPrint('dsafsdfsd: $data');

    debugPrint(file1.path);
    // debugPrint('dsafsdfsd_file2: ${file2.path}');
    // debugPrint('dsafsdfsd_file3: ${file4.path}');
    // debugPrint('dsafsdfsd_file4: ${file4.path}');

    // investorProfileImage
    // investorSignImage
    // investorNidImage
    // investorBoImage

    data["investorProfileImage"] = await MultipartFile.fromFile(file1.path);
    data["investorNidImage"] = await MultipartFile.fromFile(file2.path);
    data["investorSignImage"] = await MultipartFile.fromFile(file3.path);
    data["investorBoImage"] = await MultipartFile.fromFile(file4.path);

    return FormData.fromMap(data);
  }

  static Future<FormData> fileToMap({
    required Map<String, dynamic> map,
    required File file1,
    required File file2,
    required File file3,
    required File file4,
    required File file5,
    required File file6,
    required File file7,
    required File file8,
    required List<File> nomineePhoto,
    required List<File> nomineeNidPhoto,
    required List<File> nomineeSignature,
    required String jointAccount,
  }) async {
    Map<String, dynamic> mapData = {};
    map.forEach((key, value) {
      mapData[key] = value;
    });
    print("Manikkk Before_> $mapData");
    mapData["investor_photo"] = await MultipartFile.fromFile(file1.path);
    mapData["investor_nid_photo"] = await MultipartFile.fromFile(file2.path);
    mapData["investor_signature"] = await MultipartFile.fromFile(file3.path);
    mapData["investor_cheque_photo"] = await MultipartFile.fromFile(file4.path);
    mapData["link_bo_photo"] = await MultipartFile.fromFile(file5.path);

    // if(file4.path.isNotEmpty){
    //   mapData["tin"] = await MultipartFile.fromFile(file4.path);
    // }

    if (jointAccount == '2') {
      mapData["joint_applicant_photo"] = await MultipartFile.fromFile(
        file6.path,
      );
      mapData["joint_applicant_sign"] = await MultipartFile.fromFile(
        file7.path,
      );

      if (file8.path.isNotEmpty) {
        mapData["joint_tin"] = await MultipartFile.fromFile(file8.path);
      }
    }

    for (int i = 0; i < nomineePhoto.length; i++) {
      var myFile = File(nomineePhoto[i].path);
      mapData["nominee_photo[$i]"] = await MultipartFile.fromFile(myFile.path);
    }
    for (int i = 0; i < nomineeNidPhoto.length; i++) {
      var myFile = File(nomineeNidPhoto[i].path);
      mapData["nominee_nid_photo[$i]"] = await MultipartFile.fromFile(
        myFile.path,
      );
    }
    for (int i = 0; i < nomineeSignature.length; i++) {
      var myFile = File(nomineeSignature[i].path);
      mapData["nominee_signature[$i]"] = await MultipartFile.fromFile(
        myFile.path,
      );
    }

    // if(file11.path.isNotEmpty){
    //   mapData["nominee_applicant_photo"] = await MultipartFile.fromFile(file11.path);
    // }
    //
    // if(file12.path.isNotEmpty){
    //   mapData["nominee_applicant_sign"] = await MultipartFile.fromFile(file12.path);
    // }
    //
    // if(file13.path.isNotEmpty){
    //   mapData["nominee_nid_applicant_photo"] = await MultipartFile.fromFile(file13.path);
    // }

    print("Manikkk After> ${mapData["nominee_signature[1]"]}");

    return FormData.fromMap(mapData);
  }
}

// Future<void> postFormData({
//   required int investorId,
//   required String investorName,
//   required File photo,
//   required File signature,
//   required List<File> nomineePhotos,
//   required List<File> nomineeSignatures,
// }) async {
//   try {
// // Create Dio instance
//     final dio = Dio();
//
// // Create FormData
//     final formData = FormData.fromMap({
//       investor_id': '$investorId',
//       investor_name': investorName,
//       photo': await MultipartFile.fromFile(photo.path, filename: 'photo.jpg'),
//       signature': await MultipartFile.fromFile(signature.path, filename: 'signature.jpg'),
// // Nominee photos and signatures
//       for (int i = 0; i < nomineePhotos.length; i++) ...{
//         nominee_photo[$i]': await MultipartFile.fromFile(nomineePhotos[i].path, filename: 'nominee_photo_$i.jpg'),
//         nominee_signature[$i]': await MultipartFile.fromFile(nomineeSignatures[i].path, filename: 'nominee_signature_$i.jpg'),
//       },
//     });
//
// // Post the FormData
//     final response = await dio.post(
//       https://yourapiendpoint.com/upload', // Replace with your API endpoint
//       data: formData,
//     );
//
//     print('Response: ${response.data}');
//   } catch (e) {
//     print('Error:$e');
//   }
// }
