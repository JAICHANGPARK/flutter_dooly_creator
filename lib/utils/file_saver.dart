import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_dooly_creator/res/app_string.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:ui' as ui;


Future<Uint8List?> getWidgetBytes(GlobalKey globalKey) async {
  var renderObject = globalKey.currentContext!.findRenderObject();
  if (renderObject is RenderRepaintBoundary) {
    var boundary = renderObject;
    ui.Image image = await boundary.toImage();
    ByteData? byteData = await (image.toByteData(format: ui.ImageByteFormat.png));
    Uint8List pngBytes = byteData!.buffer.asUint8List();
    return pngBytes;
  }
  return null;
}

Future<bool> saveFile({Uint8List? data, String fileName = "temp"}) async {
  String datetime = DateFormat("yyyy-MM-dd_HHmmss").format(DateTime.now());
  final directory = (await getApplicationDocumentsDirectory()).path;
  File imgFile = new File('$directory/screenshot_${datetime}.png');

  if(data == null){
    Fluttertoast.showToast(msg: "저장할 정보가 없어요 ㅠㅠ", backgroundColor: Colors.orange, textColor: Colors.black);
    return false;
  }
  try {
    imgFile.writeAsBytes(data);
  } catch (e) {
    Fluttertoast.showToast(msg: e.toString());
    return false;
  }
  try {
    final result = await ImageGallerySaver.saveImage(data, quality: 100, name: "${fileName}_$datetime");
    print(result);
    if (result['isSuccess'] == true) {
      Fluttertoast.showToast(msg: "저장 성공");
    } else {
      Fluttertoast.showToast(msg: "$ERROR_SAVE_IMAGE_FILE", backgroundColor: Colors.orange, textColor: Colors.black);
      return false;
    }
  } catch (e) {
    Fluttertoast.showToast(msg: e.toString());
    return false;
  }
  return true;
}

void _capture(GlobalKey key) async {
  print("START CAPTURE");
  String datetime = DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());
  var renderObject = key.currentContext!.findRenderObject();
  if (renderObject is RenderRepaintBoundary) {
    var boundary = renderObject;
    ui.Image image = await boundary.toImage();
    final directory = (await getApplicationDocumentsDirectory()).path;
    print(directory);
    ByteData? byteData = await (image.toByteData(format: ui.ImageByteFormat.png));
    Uint8List pngBytes = byteData!.buffer.asUint8List();
    print(pngBytes);
    File imgFile = new File('$directory/screenshot.png');
    try {
      imgFile.writeAsBytes(pngBytes);
      print("FINISH CAPTURE ${imgFile.path}");
    } catch (e) {
      print(e);
    }
    try {
      final result = await ImageGallerySaver.saveImage(pngBytes, quality: 100, name: "dooly_hello_$datetime");
      if (result['isSuccess'] == true) {
        Fluttertoast.showToast(msg: "저장 성공");
      } else {
        Fluttertoast.showToast(msg: "$ERROR_SAVE_IMAGE_FILE", backgroundColor: Colors.orange, textColor: Colors.black);
      }
      print(result);
    } catch (e) {
      print(e);
    }
  } else {
    print("!");
  }
}