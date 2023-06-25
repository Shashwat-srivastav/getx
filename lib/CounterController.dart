import 'package:get/get.dart';

class CounterController extends GetxController {
  RxInt a = 0.obs;

  void add() {
    a.value++;
  }

  void remove() {
    a.value--;
  }
}
