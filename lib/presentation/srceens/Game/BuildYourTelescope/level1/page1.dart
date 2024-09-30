import 'package:eyesofcosmos/application/controllers/buildyourtelescopevaluecontroller.dart';
import 'package:eyesofcosmos/presentation/srceens/Game/BuildYourTelescope/level1/page2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class Item {
  String title;
  // String imageUrl;
  int id;
  String description;
  String img;
  // VoidCallback onTap;

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
      title: "Black Holes",
      description:
          "Black holes vary in size. Most massive galaxies are thought to have a supermassive black hole (hundreds of thousands to billions of times the mass of our Sun) at their centers. Other, much smaller, black holes are collapsed stars. Black holes are so dense that light cannot escape. This means we cannot see them directly, but there are indirect ways to detect and learn about them. Choose to study black holes and you might learn how the nuclei of galaxies are powered or about the life cycles of stars!",
      img: 'assets/images/gamingsection/builtItYourself/level01/blackhole.jpg'),
  Item(
      id: 1,
      title: "Star Formation",
      description:
          "Star Formation, there are details of how stars are born and evolve that are still mysterious to scientists. To see individual star birth, we have to be able to peer into the clouds of dust and gas that act as stellar nurseries. Scientists are also interested in how the many stars in galaxies act collectively to affect the evolution of those galaxies over cosmic time.Choose to study star formation and maybe you will learn something new about star birth – or even about the formation of planetary systems!",
      img: 'assets/images/gamingsection/builtItYourself/level01/star.jpg'),
  Item(
      id: 2,
      title: "Early Universe",
      description:
          "Early Universe, because light from objects that are very far away from us must travel a long time to reach us, when we observe these objects, we are really seeing them as they were a long time ago. Studying the most distant objects can help us to learn about the first ever galaxies, and maybe even the first stars. Additionally, the Big Bang (which occurred ~13.8 billion years ago) left residual radiation. Observing this radiation can help us to understand the conditions of the early universe. Choose to study the early universe and investigate our cosmic beginnings!",
      img: 'assets/images/gamingsection/builtItYourself/level01/earlyu.jpg'),
  Item(
      id: 3,
      title: "Galaxies",
      description:
          "Galaxies, Scientists still have many unanswered questions about galaxies, like how the first galaxies formed, or how we ended up with the large variety of galaxies we see today.Scientists would also like to know what the relationship is between the extremely large black holes that live at the centers of most galaxies and the galaxy that hosts them, and about how dark matter plays into the formation of galaxies.Choose to study galaxies and learn about how galaxies are powered and see how stars form within them.",
      img: 'assets/images/gamingsection/builtItYourself/level01/galaxy.jpg'),
  Item(
      id: 4,
      title: "Exoplanet",
      description:
          "Exoplanets Planets outside the solar system are more common than we once thought. Since the first discovery, we have found thousands of extrasolar planets (there may even be more planets than stars!), and we continue to narrow in on smaller and more earth-like planets. Who knows how far away we are from finding another Earth, or even signs of life elsewhere in the universe? Choose to study exoplanets and learn about the building blocks of planet formation and the evolution of planetary systems.",
      img: 'assets/images/gamingsection/builtItYourself/level01/exoplanet.jpg'),
];

class BuildTelescopeLevel1Page1 extends StatefulWidget {
  const BuildTelescopeLevel1Page1({super.key});

  @override
  State<BuildTelescopeLevel1Page1> createState() =>
      _BuildTelescopeLevel1Page1State();
}

class _BuildTelescopeLevel1Page1State extends State<BuildTelescopeLevel1Page1> {
  final Buildyourtelescopevaluecontroller appController = Get.find();
  int controller = 0;
  @override
  void initState() {
    // TODO: implement initState
    void initState() {
      // TODO: implement initState
      super.initState();
      appController.updateState('$controller', 1);
    }

    super.initState();
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
                'What would you like to study?\nYou may make ONE selection.',
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

            Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.8,
                child: MasonryGridView.count(
                    itemCount: 5,
                    crossAxisCount: 2,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          controller = index;
                          appController.updateState('$controller', 1);
                          setState(() {});
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
                                      color: Color.fromARGB(255, 235, 234, 234),
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
                  "Science",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {
                    Get.to(const BuildYourOwnLevel1Page2());
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
                  const BoxDecoration(color: Color.fromARGB(146, 0, 0, 0)),
              child: Text(
                value[controller].description,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),

            // Container(
            //   padding: EdgeInsets.all(20),
            //   width: MediaQuery.of(context).size.width * 1,
            //   height: MediaQuery.of(context).size.height * 0.5,
            //   child: SingleChildScrollView(
            //     child: Column(
            //       children: [
            //         controller
            //             ? Column(
            //               // mainAxisAlignment: MainAxisAlignment.start,
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   Text(
            //                     "Reflective Telescope:",
            //                     style: TextStyle(
            //                         fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
            //                   ),
            //                   Padding(
            //                     padding: const EdgeInsets.symmetric(
            //                          vertical: 10),
            //                     child: Center(
            //                       child: Text(
            //                         "1.Reflecting telescopes date back to 1616.\n2.Newton's 1668 design was the first practical one.\n3.He introduced an angled secondary mirror for easier image viewing.\n4.This design is called a Newtonian Reflector.\n5.The Cassegrain Reflector uses a  different mirror arrangement, affecting light reflection.",
            //                         style: TextStyle(
            //                             fontSize: 15, color: Colors.white),
            //                       ),
            //                     ),
            //                   ),
            //                    Text("Watch Video:",style: TextStyle(color: Colors.white,fontSize: 24,fontWeight:FontWeight.bold),),
            //                   InkWell(
            //                       onTap: () {
            //                         Get.to(VideoExample(
            //                           videoId: 'x8wrp34-IXA',
            //                         ));
            //                       },
            //                       child: Container(
            //                           height: 250,
            //                           width: MediaQuery.of(context).size.width * 1,
            //                           child: Image.network(
            //                               YoutubePlayer.getThumbnail(
            //                                   videoId: "x8wrp34-IXA")))),
            //                                   Text("A refracting telescope uses a conv'x lens t'bend and focus light, which is then'magnifie'by a concave lens in the eyep'ece. Man'modern telescopes include a 'diagonal' mirror to angle the light for easier viewing",style: TextStyle(color: Colors.white),)

            //                 ],
            //               )
            //             : Column(
            //               // mainAxisAlignment: MainAxisAlignment.start,
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   Text(
            //                     "Refractive Telescope:",
            //                     style: TextStyle(
            //                         fontSize: 24, color: Colors.white,fontWeight:FontWeight.bold),
            //                   ),
            //                   Padding(
            //                     padding: const EdgeInsets.symmetric(
            //                         vertical: 10),
            //                     child: Center(
            //                       child: Text(
            //                         "1.The first refracting telescopes  appeared in the Netherlands around 1608.\n2.Galileo improved and popularized the design in 1609\n3.He is often credited for the telescope's advancement.\n4.Galileo was the first to use a telescope for space study.\n5.He discovered Jupiter's four largest moons.",
            //                         style: TextStyle(
            //                             fontSize: 15, color: Colors.white),
            //                       ),
            //                     ),
            //                   ),

            //                   Text("Watch Video:",style: TextStyle(color: Colors.white,fontSize: 24,fontWeight:FontWeight.bold),),
            //                   InkWell(
            //                       onTap: () {
            //                         Get.to(VideoExample(
            //                           videoId: 'uSC-71vXgh0',
            //                         ));
            //                       },
            //                       child: Container(
            //                            height: 250,
            //                           width: MediaQuery.of(context).size.width * 1,
            //                           child: Image.network(
            //                               YoutubePlayer.getThumbnail(
            //                                   videoId: "uSC-71vXgh0")))),

            //                                   Text("A refracting telescope uses a conv'x lens t'bend and focus light, which is then'magnifie'by a concave lens in the eyep'ece. Man'modern telescopes include a 'diagonal' mirror to angle the light for easier viewing",style: TextStyle(color: Colors.white),)
            //                 ],
            //               ),
            //       ],
            //     ),
            //   ),
            // ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}
