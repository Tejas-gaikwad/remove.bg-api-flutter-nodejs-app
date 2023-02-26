import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class HomeScreenProvider extends ChangeNotifier {
  var data;
  bool isLoading = false;
  final ImagePicker _picker = ImagePicker();
  XFile? photo;
  File? photofile;

  void getImage() async {
    isLoading = true;
    notifyListeners();
    var res = await http.get(
      Uri.parse("http://10.0.2.2:3000/remove-bg"),
      headers: {
        'X-Api-Key': 'NDEt5aYiEEn412coPt3RJhY1',
      },
    );

    data = Uint8List.fromList(res.bodyBytes);

    print("data ---   " + data.toString());
    isLoading = false;
    notifyListeners();
  }

  takeImage() async {
    photo = await _picker.pickImage(source: ImageSource.camera);
    photofile = File(photo!.path);
    print(photo.toString());
    notifyListeners();
  }
}
