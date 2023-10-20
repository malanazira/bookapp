import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bookapp/models/product.dart';

class categoriescreen extends StatelessWidget {
  const categoriescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 36, left: 16, right: 16, bottom: 10),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/left-line.svg',
                  ),
                  Padding(padding: EdgeInsets.only(right: 130)),
                  Text(
                    'Populer',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Nunito',
                      
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: ProductBookapp.categori1.length,
                itemBuilder: (BuildContext context, int index) {
                  var item = ProductBookapp.categori1;
                  
                  return Container(
                    margin: EdgeInsets.only(bottom: 8), // Berikan margin antar item
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            ProductBookapp.categori1[index]['photo'],
                            width: 100, // Sesuaikan dengan lebar gambar
                            height: 150, // Sesuaikan dengan tinggi gambar
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 8), // Berikan spasi antara gambar dan teks
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ProductBookapp.categori1[index]['autor'],
                                style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 10,
                                ),
                              ),
                              SizedBox(height: 4), // Berikan spasi antara teks
                              Text(
                                ProductBookapp.categori1[index]['title'],
                                style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 4), // Berikan spasi antara teks
                              Row(
                                children: [
                                  Icon(
                                    Icons.star_rounded,
                                    size: 20,
                                  ),
                                  Text(
                                    "4.8",
                                    style: TextStyle(
                                      fontFamily: "Nunito",
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
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
    );
  }
}
