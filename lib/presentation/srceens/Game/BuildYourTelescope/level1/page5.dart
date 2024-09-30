import 'package:eyesofcosmos/application/controllers/buildyourtelescopevaluecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildTelescopeLevel1FinalScreen extends StatefulWidget {
  const BuildTelescopeLevel1FinalScreen({super.key});

  @override
  State<BuildTelescopeLevel1FinalScreen> createState() =>
      _BuildTelescopeLevel1FinalScreenState();
}

class _BuildTelescopeLevel1FinalScreenState
    extends State<BuildTelescopeLevel1FinalScreen> {
  final Buildyourtelescopevaluecontroller appController = Get.find();

  String currentState = '';

  @override
  void initState() {
    super.initState();
    currentState = appController.myState.value; // Initial state from controller
  }

  void updateState(String newState) {
    setState(() {
      currentState = newState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(left: 20, bottom: 20),
              child: Text(
                'Your Satellite ..',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'PoetsenOne',
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Display different images based on the state without using Obx
            Center(
              child: Container(
                height: 300,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(getImageForState(currentState)),
                    fit: BoxFit.cover, // Using BoxFit to fit the image
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Optional: Display the current state
            // R
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
          ],
        ),
      ),
    );
  }

  // Function to get the image path based on the current state
  String getImageForState(String state) {
    switch (state) {
      case '10002':
        return 'assets/images/gamingsection/builtItYourself/level01/opticalir.jpg';
      case '33022':
        return 'assets/images/gamingsection/builtItYourself/level01/opticalir.jpg';
      default:
        return 'assets/images/gamingsection/builtItYourself/level01/opticalir.png';
    }
  }
}
