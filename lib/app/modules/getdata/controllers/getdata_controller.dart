import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../data/Mahasiswa.dart';

class GetdataController extends GetxController {
  RxList<MahasiswaElement> mahasiswa = RxList<MahasiswaElement>([]);
  String _name = "Ricky Triyoga Wardhana";
  RxBool isLoading = false.obs;
  var data = Get.arguments;
  Future<void> fetchArticles() async {
    try {
      isLoading.value = true; // Set loading state to true
      final response =
      await http.get(Uri.parse('https://api-frontend.kemdikbud.go.id/hit_mhs/$_name'));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final articlesResult = Mahasiswa.fromJson(jsonData);
        mahasiswa.value = articlesResult.mahasiswa;
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('An error occurred: $e');
    } finally {
      isLoading.value = false; // Set loading state to false when done
    }
  }


  final count = 0.obs;

  @override
  void onInit() async {
    _name = data;
    super.onInit();
    await fetchArticles();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}