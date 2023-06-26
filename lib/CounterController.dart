import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CounterController extends GetxController {
  RxInt a = 0.obs;

  void add() {
    a.value++;
  }

  void remove() {
    a.value--;
  }
}

class ImagePickerController extends GetxController {
  RxString pathof = "".obs;
  Future getImage() async {
    final ImagePicker _pick = ImagePicker();
    final image = await _pick.pickImage(source: ImageSource.camera);
    if (image != null) {
      pathof.value = image.path.toString();
    }
  }
}
