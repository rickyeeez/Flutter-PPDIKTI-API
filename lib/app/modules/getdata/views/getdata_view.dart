import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_api_mahasiswa/app/data/Mahasiswa.dart';

import '../controllers/getdata_controller.dart';

class GetdataView extends GetView<GetdataController> {
  const GetdataView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Fetching Example'),
      ),
      body: Obx(
            () {
          if (controller.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: controller.mahasiswa.length,
              itemBuilder: (BuildContext context, int index) {
                MahasiswaElement mahasiswa = controller.mahasiswa[index];
                List mhsSplit;
                mhsSplit = mahasiswa.text.split(",");
                return ListTile(
                  minVerticalPadding : 20,
                  title: Text(mhsSplit[0]),
                  subtitle: Column(
                    children: [
                      Text(mhsSplit[1]),
                      Text(mhsSplit[2]),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children:[
                      IconButton(
                        icon: Icon(Icons.web),
                        onPressed: () => {
                          debugPrint(mahasiswa.websiteLink.toString()),
                          Get.toNamed("/webview",arguments: mahasiswa.websiteLink)
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
