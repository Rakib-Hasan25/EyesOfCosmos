import 'package:eyesofcosmos/application/controllers/buildyourtelescopevaluecontroller.dart';
import 'package:eyesofcosmos/presentation/srceens/Game/BuildYourTelescope/level1/page4.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Item {
  String title;
  // String imageUrl;
  int id;
  String description;
  // String img;
  // VoidCallback onTap;

  Item({
    required this.id,
    required this.title,
    required this.description,
    // required this.img
    // required this.imageUrl,
  });
}

List<Item> value = [
  Item(
    id: 0,
    title: "Optical Spectrometer",
    description: "sdfsa",
    // img:'assets/images/gamingsection/builtItYourself/level01/opticalspectrometer.jpg'
  ),
  Item(
    id: 1,
    title: "Optical Camera",
    description: "sdfasdf",
    // img:'assets/images/gamingsection/builtItYourself/level01/opticalcamera.jpg'
  ),
];

class BuildYourOwnLevel1Page3 extends StatefulWidget {
  const BuildYourOwnLevel1Page3({super.key});

  @override
  State<BuildYourOwnLevel1Page3> createState() =>
      _BuildYourOwnLevel1Page3State();
}

class _BuildYourOwnLevel1Page3State extends State<BuildYourOwnLevel1Page3> {
  bool specto_controller = true;
  bool camera_controller = false;
  int description_controller = 0;

  final Buildyourtelescopevaluecontroller appController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        // backgroundColor: Colors.black12,
        elevation: 0,
        iconTheme: const IconThemeData(
            color: Colors.white), // Set AppBar icons to white
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.09,
            // ),
            const Padding(
              padding: EdgeInsets.only(left: 20, bottom: 20),
              child: Text(
                'Choose one or more instruments for each wavelength you have selected. You may only choose up to a TOTAL of TWO instruments.',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'PoetsenOne',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    if (specto_controller) {
                      specto_controller = false;
                    } else {
                      specto_controller = true;
                      description_controller = 0;
                    }
                    setState(() {});
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 50, bottom: 50),
                    child: Container(
                      width: 100,
                      height: specto_controller ? 100 : 90,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        image: const DecorationImage(
                          image: AssetImage(
                              'assets/images/gamingsection/builtItYourself/level01/opticalspectrometer.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            left: 20,
                            bottom: 20,
                            child: Text(
                              value[0].title,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (camera_controller) {
                      camera_controller = false;
                    } else {
                      camera_controller = true;
                      description_controller = 1;
                    }
                    setState(() {});
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 50, bottom: 50),
                    child: Container(
                      width: 100,
                      height: camera_controller ? 100 : 90,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        image: const DecorationImage(
                          image: AssetImage(
                              'assets/images/gamingsection/builtItYourself/level01/opticalcamera.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            left: 20,
                            bottom: 20,
                            child: Text(
                              value[1].title,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 10,
            ),
            Obx(() => Text('Current State: ${appController.myState}')),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Instruments",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {
                    // Get.to(BuildYourOwnLevel1Page2());

                    if (camera_controller && specto_controller) {
                      appController.updateState2('11');
                    }
                    if (specto_controller && camera_controller == false) {
                      appController.updateState2('10');
                    }
                    if (specto_controller == false && camera_controller) {
                      appController.updateState2('01');
                    }
                    if (specto_controller == false &&
                        camera_controller == false) {
                      appController.updateState2('10');
                    }
                    Get.to(const BuildYourOwnLevel1Page4());
                  },
                  child: const Text(
                    "Next Step",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 1,
              decoration:
                  const BoxDecoration(color: Color.fromARGB(163, 0, 0, 0)),
              child: Text(
                value[description_controller].description,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}
