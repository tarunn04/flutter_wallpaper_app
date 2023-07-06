import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper_app/services/api_controller.dart';

class SearchBarWidget extends StatelessWidget {
   SearchBarWidget({
    super.key,
  });

  final ImageApiController _apiController = Get.find<ImageApiController>();
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  const BoxDecoration(
        color: Color.fromARGB(255, 232, 229, 229),
       borderRadius: BorderRadius.all(Radius.circular(30)),
      ),

      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
           border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide.none
          ),
          hintText: "Search Wallpaper...",
          hintStyle: TextStyle(
            fontFamily: GoogleFonts.nunito().fontFamily,
            fontWeight: FontWeight.w500 
          ),
          suffixIcon: InkWell(
            onTap: () {
              print("fi");
              Get.toNamed("/category",arguments: searchController.text);
            },

            child: const Icon(Icons.search,size: 30,
            color: Color.fromARGB(112, 0, 0, 0),),
          ),
          
        ),
      ),
    );
  }
}