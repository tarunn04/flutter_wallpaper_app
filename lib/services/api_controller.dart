import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_app/utils/constants.dart';
class ImageApiController extends GetxController{
  final RxList imageList = RxList();

  Future<void> fetchApi() async{
    var response = await http.get(Uri.parse("https://api.unsplash.com/photos/?client_id=$UNSPLASH_API_KEY"));
    var result = jsonDecode(response.body);
    imageList.addAll(result);
    // imageList.addAll(result["urls"]);
    // print(imageList.length);
  }
}