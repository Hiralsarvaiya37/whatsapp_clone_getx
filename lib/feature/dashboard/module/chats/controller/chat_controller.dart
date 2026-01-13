import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ChatController extends GetxController{
  final TextEditingController messageController = TextEditingController();
  
  RxBool isShow = false.obs;
  RxList<String> messages = <String>[].obs;
}