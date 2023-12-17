import 'package:bookapp/models/product.dart';
import 'package:bookapp/viewmodels/rekomendasimodel/fetch_https.dart';
import 'package:bookapp/viewmodels/populermodel/fetch_https.dart';
import 'package:flutter/material.dart';
// import 'package:readmore/readmore.dart';

class BookDetail extends StatelessWidget {
  final Book item;
  final ApiFetch bookApi = ApiFetch();
  final ApiFetch2 bookApi2 = ApiFetch2();

  BookDetail({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        // FutureBuilder pertama untuk ApiFetch
        future: bookApi.getapiData(),
        builder: (context, snapshot1) {
          if (snapshot1.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot1.hasError) {
            return Center(
              child: Text('Error: ${snapshot1.error}'),
            );
          } else {
            // Data berhasil diambil, tampilkan hasilnya

            return FutureBuilder(
              // FutureBuilder kedua untuk ApiFetch2
              future: bookApi2.getapiData(),
              builder: (context, snapshot2) {
                if (snapshot2.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot2.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot2.error}'),
                  );
                } else {
                  // Data kedua berhasil diambil, tampilkan hasilnya

                  return Stack(
                    children: [
                      Container(
                        color: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 550),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF6456146),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 30,
                        right: 120,
                        child: Container(
                          height: 50,
                          width: 500,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 40,
                        right: 140,
                        child: Container(
                          height: 50,
                          width: 120,
                          child: Text(
                            "Deskripsi",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
            top: 110,
            left: 45,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                item.photo,
                height: 150, // Adjust the height as needed
                width: 120, // Adjust the width as needed
                fit: BoxFit.cover, // This ensures the image covers the entire box
              ),
            ),
          ),
                      Positioned(
                        top: 150,
                        left: 180,
                        child: Container(
                          height: 150,
                          width: 180,
                          child: Text(
                            item.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Nunito',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 320,
                        left: 50,
                        child: Container(
                          height: 105,
                          width: 315,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      item.halaman,
                                      style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text("halaman"),
                                  ],
                                ),
                                VerticalDivider(
                                  color: Colors.black,
                                  width: 5,
                                  thickness: 1,
                                  endIndent: 50,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      item.bahasa,
                                      style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text("bahasa"),
                                  ],
                                ),
                                VerticalDivider(
                                  color: Colors.black,
                                  width: 5,
                                  thickness: 1,
                                  endIndent: 50,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      item.tahun,
                                      style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text("Terbit"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 380,
                        left: 68,
                        child: ElevatedButton(
                          onPressed: () {
                            // Aksi yang akan dijalankan saat tombol ditekan
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.amber,
                            minimumSize: Size(280, 30),
                          ),
                          child: Text("Pinjam"),
                        ),
                      ),
                      Positioned(
                        top: 450,
                        left: 30,
                        child: Container(
                          child: Text(
                            "Deskripsi buku",
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 480,
                        left: 30,
                        child: Container(
                          width: 315,
                          child: Text(
                            item.sinopsis,
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ),
                    ],
                  );
                }
              },
            );
          }
        },
      ),
    );
  }
}
