import 'dart:io';
import 'dart:typed_data';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:image/image.dart' as img;

class screenshotcontrol extends GetxController{
  ScreenshotController screenshotController = ScreenshotController();
  ScreenshotController screenshotController2 = ScreenshotController();

  takeScreenshotandShare(int info) async {
    Uint8List? images;
if(info == 0){
    images = await screenshotController.capture();
}else if(info == 1){
  images = await screenshotController2.capture();
}

    img.Image? image = img.decodeImage(images!);

    // Get the directory for saving images
    final Directory directory = await getApplicationDocumentsDirectory();
    final String filePath = '${directory.path}/image.jpg';

    // Save the image as a JPEG file
    File imageFile = File(filePath);
    await imageFile.writeAsBytes(img.encodeJpg(image!));

    // Share the image file
    await Share.shareFiles([filePath], text: 'Check out this image!');

  }

}