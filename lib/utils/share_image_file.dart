import 'dart:typed_data';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

void shareImageFile(Uint8List data, String name) async {
  try {
    await Share.file('둘리짤생성기', '${name}_${DateFormat("hhmmss").format(DateTime.now())}.png', data, 'image/png',
        text: '');
  } catch (e) {
    Fluttertoast.showToast(msg: 'error: $e');
  }
}