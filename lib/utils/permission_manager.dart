
import 'package:permission_handler/permission_handler.dart';

Future checkManageStoragePermission() async {
  var status = await Permission.manageExternalStorage.status;

  if (status.isDenied) {
    await Permission.manageExternalStorage.request();
  }
  if (status.isPermanentlyDenied) {
    await Permission.manageExternalStorage.request();
  }
  if (status.isLimited) {
    await Permission.manageExternalStorage.request();
  }
  if (status.isRestricted) {
    await Permission.manageExternalStorage.request();
  }
}

Future getPermission() async {
  var status = await Permission.storage.status;

  if (status.isDenied) {
    await Permission.storage.request();
  }
  if (status.isPermanentlyDenied) {
    await Permission.storage.request();
  }
  if (status.isLimited) {
    await Permission.storage.request();
  }
  if (await Permission.storage.isRestricted) {
    await Permission.storage.request();
  }
}