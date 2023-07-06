import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_app/utils/constants.dart';
class ImageApiController extends GetxController{
  final RxList imageList = RxList();
  final RxList searchList = RxList();
  int pageNo = 1;

  Future<void> fetchApi() async{
    var response = await http.get(Uri.parse("https://api.unsplash.com/photos/?client_id=$UNSPLASH_API_KEY"));
    var result = jsonDecode(response.body);
    imageList.addAll(result);
    // print(result);
  }

  Future<void> searchFetchApi(String search) async{
    searchList.clear();
    var response = await http.get(Uri.parse("https://api.unsplash.com/search/photos/?client_id=$UNSPLASH_API_KEY&query=$search&per_page=50&page=$pageNo"));
    var result = jsonDecode(response.body);
    searchList.addAll(result['results']);
    pageNo++;
    // print();
  }
  Future<void> addSearchFetchApi(String search) async{
    var response = await http.get(Uri.parse("https://api.unsplash.com/search/photos/?client_id=$UNSPLASH_API_KEY&query=$search&per_page=50&page=$pageNo"));
    var result = jsonDecode(response.body);
    searchList.addAll(result['results']);
    pageNo++;
    // print();
  }
}