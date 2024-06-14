import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 200,
            ),
            SizedBox(
              width: 300,
                child: Image.network(
                    'https://pddikti.kemdikbud.go.id/asset/gambar/logopddikti.png',
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                                : null,
                          )
                      );
                    }
                    ),
              ),
        const SizedBox(
          height: 50,
        ), SizedBox(
          width: 300,
          child: TextField(
            controller: controller.nameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Masukkan Nama',
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        OutlinedButton(
          onPressed: () {
            Get.toNamed("/getdata",arguments: controller.nameController.text);
          },
          child: const Text('Cari Mahasiswa'),
        ),
        ],
        ),
      ),
    );
  }
}
