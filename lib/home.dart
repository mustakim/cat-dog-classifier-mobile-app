import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final bool _loading = true;

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
                      : Container(),
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: <Widget>[
                        GestureDetector(
                            onTap: () {},
                            child: Container(
                                width: MediaQuery.of(context).size.width - 250,
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 18),
                                decoration: BoxDecoration(
                                    color: Colors.yellowAccent,
                                    borderRadius: BorderRadius.circular(6)),
                                child: const Text(
                                  'Capture a Photo',
                                  style: TextStyle(color: Colors.black),
                                ))),
                        const SizedBox(height: 15),
                        GestureDetector(
                            onTap: () {},
                            child: Container(
                                width: MediaQuery.of(context).size.width - 250,
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 18),
                                decoration: BoxDecoration(
                                    color: Colors.yellowAccent,
                                    borderRadius: BorderRadius.circular(6)),
                                child: const Text(
                                  'Select a photo',
                                  style: TextStyle(color: Colors.black),
                                ))),
                      ],
                    ))
              ],
            )));
  }
}
