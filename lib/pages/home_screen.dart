import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper_app/utils/constants.dart';
import 'package:wallpaper_app/widgets/searchbar.dart';
import 'package:get/get_core/src/get_main.dart';

import '../services/api_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ImageApiController _imageApiController = Get.put(ImageApiController());
  @override
  
  void initState() {
    // TODO: implement initState
    super.initState();
    _imageApiController.fetchApi();
  }
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Text(
                "HOME",
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
              ),
              const SizedBox(height: 10),
              const SearchBarWidget(),
              const SizedBox(height: 10),
             SizedBox(
              height: screenHeight * 0.3,
              child: Obx(() => ListView.builder(
                itemCount:  _imageApiController.imageList.length > 10 ? 10 : _imageApiController.imageList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => Get.toNamed("/wallpaperPage",arguments: _imageApiController.imageList[index]["urls"]["full"]),
                    child: Container(
                      decoration:const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      width: screenWidth * 0.5,
                      margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 4),
                  
                      child: Image.network(_imageApiController.imageList[index]["urls"]["regular"],
                      fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              )),
            ),
              const SizedBox(height: 10,),
              Text(
                "Categories",
                style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color:const Color.fromARGB(255, 45, 45, 45),
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),

              GridView.builder(
                padding: const EdgeInsets.symmetric(vertical: 15),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                 childAspectRatio: 1.8,
                ),
                itemCount: 10, // Replace with your desired item count
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => Get.toNamed("/category",arguments: "${imageList[index]}"),
                    child: Container(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            'assets/images/${imageList[index]}.jpg',
                            fit: BoxFit.cover,
                          ),
                          Text(
                            "${imageList[index]}",
                            style: TextStyle(
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
