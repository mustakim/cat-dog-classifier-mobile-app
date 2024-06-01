import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _loading = true;
  late File _image;
  List _output;
  final picker = ImagePicker();

  _HomeState({List? output}) : _output = output ?? [];

  @override
  void initState() {
    super.initState();
    loadModel().then((value) {
      setState(() {});
    });
  }

  detectImage(File image) async {
    var output = await Tflite.runModelOnImage(
        path: image.path,
        numResults: 2,
        threshold: 0.6,
        imageMean: 127.5,
        imageStd: 127.5);

    setState(() {
      _output = output!;
      _loading = false;
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/models/model_unquant.tflite",
      labels: "assets/models/labels.txt",
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  pickImage() async {
    var image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) return null;

    setState(() {
      _image = File(image.path);
    });

    detectImage(_image);
  }

  pickImageFromGallery() async {
    var image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return null;

    setState(() {
      _image = File(image.path);
    });

    detectImage(_image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 50,
                ),
                const Text('Bihobol',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                const SizedBox(
                  height: 5,
                ),
                const Text('Cats & Dogs Detector App',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w500)),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: _loading
                      ? SizedBox(
                          width: 350,
                          child: Column(
                            children: <Widget>[
                              Image.asset("assets/images/cat_dog_icon.png"),
                              const SizedBox(
                                height: 50,
                              ),
                            ],
                          ),
                        )
                      : Container(
                          child: Column(
                          children: <Widget>[
                            SizedBox(height: 250, child: Image.file(_image)),
                            const SizedBox(
                              height: 20,
                            ),
                            _output != null
                                ? Text(
                                    '${_output[0]['label']}',
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  )
                                : Container(),
                            const SizedBox(
                              height: 10,
                            )
                          ],
                        )),
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: <Widget>[
                        GestureDetector(
                            onTap: () {
                              pickImage();
                            },
                            child: Container(
                                width: MediaQuery.of(context).size.width - 250,
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 18),
                                decoration: BoxDecoration(
                                    color: Colors.yellowAccent,
                                    borderRadius: BorderRadius.circular(6)),
                                child: const Text(
                                  'Capture a Photo',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ))),
                        const SizedBox(height: 5),
                        GestureDetector(
                            onTap: () {
                              pickImageFromGallery();
                            },
                            child: Container(
                                width: MediaQuery.of(context).size.width - 250,
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 18),
                                decoration: BoxDecoration(
                                    color: Colors.redAccent,
                                    borderRadius: BorderRadius.circular(6)),
                                child: const Text(
                                  'Select a photo',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ))),
                      ],
                    ))
              ],
            )));
  }
}
