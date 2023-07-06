import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper_app/services/api_controller.dart';

class Category extends StatefulWidget {
  final String category;
  Category({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  final ImageApiController _imageApiController = Get.find<ImageApiController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _imageApiController.searchFetchApi(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 50,),
            Text(
                  widget.category.toUpperCase(),
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
            Expanded(
              child: Obx(() =>  _imageApiController.searchList.isEmpty?
                Center(child: CircularProgressIndicator())
              :GridView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  itemCount: _imageApiController.searchList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.7
                    ), 
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.toNamed("/wallpaperPage",arguments:_imageApiController.searchList[index]['urls']['full'] );
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: Image.network(_imageApiController.searchList[index]['urls']['regular'],fit: BoxFit.cover,),
                      ),
                    );
                  },),
              ),
  
            )
          ],
        ),
      ),
    );
  }
}