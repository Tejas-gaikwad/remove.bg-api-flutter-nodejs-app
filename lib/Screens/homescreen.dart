import 'dart:io';

import 'package:background_remove/Provider/homescreenrovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final homeProvider =
        Provider.of<HomeScreenProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(child: Consumer<HomeScreenProvider>(
        builder: (context, homescreenProvider, child) {
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                SizedBox(height: 50),
                InkWell(
                  onTap: () async {
                    await homescreenProvider.takeImage();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.8,
                    height: homescreenProvider.photo != null ? 200 : 150,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    color: Colors.grey.withOpacity(0.3),
                    child: homescreenProvider.photo != null
                        ? Center(
                            child: Image.file(homescreenProvider.photofile!))
                        : Icon(Icons.camera_alt_outlined),
                  ),
                ),
                SizedBox(height: 50),
                InkWell(
                  onTap: () {
                    homeProvider.getImage();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    color: Colors.pink,
                    child: Text("Click on button"),
                  ),
                ),
                SizedBox(height: 50),

                homescreenProvider.data == null &&
                        homescreenProvider.isLoading == false
                    ? Text(
                        "NO DATA   " + homescreenProvider.isLoading.toString())
                    : homescreenProvider.isLoading == true
                        ? Center(
                            child: CircularProgressIndicator(
                              color: Colors.blue,
                            ),
                          )
                        : Image.memory(homescreenProvider.data),
                // _file = Image.file(croppedImage)
              ],
            ),
          );
        },
      )),
    );
  }
}
