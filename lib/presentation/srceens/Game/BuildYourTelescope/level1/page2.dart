import 'package:eyesofcosmos/application/controllers/buildyourtelescopevaluecontroller.dart';
import 'package:eyesofcosmos/presentation/srceens/Game/BuildYourTelescope/level1/page3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class Item {
  String title;
  // String imageUrl;
  int id;
  String description;
  // VoidCallback onTap;
  String img;

  Item(
      {required this.id,
      required this.title,
      required this.description,
      required this.img
      // required this.imageUrl,
      });
}

List<Item> value = [
  Item(
      id: 0,
      title: "Infrared",
      description: "sdfsa",
      img: 'assets/images/gamingsection/builtItYourself/level01/infrared.jpg'),
  Item(
      id: 1,
      title: "Optical",
      description: "sdfasdf",
      img: 'assets/images/gamingsection/builtItYourself/level01/optical.jpg'),
  Item(
      id: 2,
      title: "Ultraviolet",
      description: "sdfasdf",
      img:
          'assets/images/gamingsection/builtItYourself/level01/ultraviolet.jpg'),
  Item(
      id: 3,
      title: "Microwave",
      description: "sdfasdf",
      img: 'assets/images/gamingsection/builtItYourself/level01/galaxy.jpg'),
  Item(
      id: 4,
      title: "X-ray",
      description: "sdfasdf",
      img: 'assets/images/gamingsection/builtItYourself/level01/xray.jpg'),
  Item(
      id: 5,
      title: "Gamma-Ray",
      description: "sdfasdf",
      img: 'assets/images/gamingsection/builtItYourself/level01/gamma.jpg'),
];

class BuildYourOwnLevel1Page2 extends StatefulWidget {
  const BuildYourOwnLevel1Page2({super.key});

  @override
  State<BuildYourOwnLevel1Page2> createState() =>
      _BuildYourOwnLevel1Page2State();
}

class _BuildYourOwnLevel1Page2State extends State<BuildYourOwnLevel1Page2> {
  int controller = 0;
  final Buildyourtelescopevaluecontroller appController = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    appController.updateState('$controller', 2);
  }

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
                'What wavelength do you want to use? You may only choose ONE.',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'PoetsenOne',
                ),
              ),
            ),
            const SizedBox(
              height: 2,
            ),

            Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.8,
                child: MasonryGridView.count(
                    itemCount: 6,
                    crossAxisCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          controller = index;
                          setState(() {});
                          appController.updateState('$controller', 2);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10, bottom: 10),
                          child: Container(
                            width: 100,
                            height: controller == value[index].id ? 100 : 90,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              image: DecorationImage(
                                image: AssetImage(value[index].img),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Stack(
                              children: <Widget>[
                                Positioned(
                                  left: 20,
                                  bottom: 20,
                                  child: Text(
                                    value[index].title,
                                    style: const TextStyle(
                                      color: Colors.red,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),

            const SizedBox(
              height: 10,
            ),
            Obx(() => Text('Current State: ${appController.myState}')),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "WebLength",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {
                    Get.to(const BuildYourOwnLevel1Page3());
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
                  const BoxDecoration(color: Color.fromARGB(163, 22, 21, 21)),
              child: Text(
                value[controller].description,
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
