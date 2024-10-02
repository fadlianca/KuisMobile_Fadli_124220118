import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/DetailUPNVY.dart.dart';
import 'package:flutter_application_1/dummy-fakultas.dart';

class HomePage extends StatelessWidget {
  final String username;
  final String password;

  const HomePage({Key? key, required this.username, required this.password});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Halo, $username"), //appbar berisi greeting teks dan halo username
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      //membuat card yang berisikan tulisan dan bisa di klik menuju halaman detail upnvy
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailUPNVY(),
                    ),
                  );
                },
                child: const Card(
                  elevation: 4,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sudahkah Kamu mengenal UPN JOGJA?",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                            "Kenalan lebih jauh yuk! Klik untuk mengetahui lebih banyak tentang UPNVY"),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text("List Fakultas UPNVY"), //membuat list fakultas
              SizedBox(
                height: 400,
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: facultyList.length,
                  itemBuilder: (context, index) {
                    final faculty = facultyList[index];
                    return Card(
                      elevation: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            faculty.imageUrls
                                .last, //imageurls menggunakan yg paling akhir
                            fit: BoxFit.cover,
                            height: 80,
                            width: double.infinity,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            faculty.name,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
