import 'package:aero_lounge/utils/helpers/image_picker_helper.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController get instance => Get.find();

  RxBool isPasswordVisible = false.obs;
  RxBool isNewPasswordVisible = false.obs;
  RxBool isConfirmNewPasswordVisible = false.obs;

  RxString profilePicturePath = ''.obs;
  RxBool isCreatePasswordVisible = false.obs;
  RxBool isConfirmPasswordVisible = false.obs;

  RxList<String> uploadFilePathList = <String>['', '', '', '', '', '', ''].obs;
  RxString resumePath = ''.obs;
  RxString logbookPath = ''.obs;
  RxString walkthroughPath = ''.obs;
  RxString squawkAttachmentPath = ''.obs;
  RxString supportAttachmentPath = ''.obs;

  RxBool isLogbookManually = false.obs;

  Future getImageFromGallery() async {
    final image = await ImagePickerHerlper.instance.imageFromGallery();
    if (image != null) {
      profilePicturePath.value = image.path;
    }
  }

  Future getFile({required String type, int? index}) async {
    late List<String> allowedExtensions;

    switch (type) {
      case 'documents':
        allowedExtensions = ['jpg', 'pdf', 'png'];
        break;

      case 'resume':
        allowedExtensions = ['pdf'];
        break;

      case 'logbook':
        allowedExtensions = ['csv'];
        break;

      case 'support':
        allowedExtensions = ['jpg', 'png'];
        break;

      default:
        allowedExtensions = ['pdf'];
        break;
    }

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: allowedExtensions,
    );
    if (result != null) {
      switch (type) {
        case 'documents':
          uploadFilePathList[index!] = result.files.single.path!;
          break;

        case 'resume':
          resumePath.value = result.files.single.path!;
          break;

        case 'logbook':
          logbookPath.value = result.files.single.path!;
          break;

        case 'walkthrough':
          walkthroughPath.value = result.files.single.path!;
          break;

        case 'squawk':
          squawkAttachmentPath.value = result.files.single.path!;
          break;

        case 'support':
          supportAttachmentPath.value = result.files.single.path!;
          break;

        default:
      }
    }
  }
}
