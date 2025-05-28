import 'package:image_picker/image_picker.dart';

class ImagePickerHerlper {
  ImagePickerHerlper._();
  static final instance = ImagePickerHerlper._();

  final ImagePicker _imagePicker = ImagePicker();

  Future<XFile?> imageFromGallery() async {
    final XFile? image =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    return image;
  }

  Future<XFile?> imageFromCamera() async {
    final XFile? image =
        await _imagePicker.pickImage(source: ImageSource.camera);

    return image;
  }
}
