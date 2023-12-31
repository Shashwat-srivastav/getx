import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Todo extends GetxController {
  RxList<RxString> list = <RxString>[].obs;

  void add(RxString el) {
    list.add(el);
  }
}

RxList<Contact> getcontact = <Contact>[].obs;

List<Contact> c = [];

class Contact extends GetxController {
  late String ph;
  late String name;

  Contact(var p, var n) {
    this.ph = p;
    this.name = n;
  }
}

class CounterController extends GetxController {
  RxInt a = 0.obs;

  void add() {
    a.value++;
  }

  void remove() {
    a.value--;
  }
}

class timer extends GetxController {
  RxInt s = 0.obs;
  RxInt h = 0.obs;
  RxInt m = 0.obs;

  void settime(int _s, int _h, int _m) {
    s.value = _s;
    h.value = _h;
    m.value = _m;
  }

  void reset() {
    s.value = 0;
    h.value = 0;
    m.value = 0;
  }
}

class ImagePickerController extends GetxController {
  RxString pathof = "".obs;
  Future getImage() async {
    final ImagePicker _pick = ImagePicker();
    final image = await _pick.pickImage(source: ImageSource.gallery);
    if (image != null) {
      pathof.value = image.path.toString();
    }
  }
}
