import 'package:bookapp/screens/detail.dart';
import 'package:bookapp/viewmodels/populermodel/fetch_https.dart';
import 'package:flutter/material.dart';
import 'package:bookapp/screens/homescreen.dart';
import 'package:bookapp/models/product.dart';

class Populer extends StatefulWidget {
  const Populer({Key? key}) : super(key: key);

  @override
  State<Populer> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Populer> {
  final ApiFetch bookk = ApiFetch();

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
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return homescreen();
                        },
                      ));
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.black,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(right: 130)),
                  Text(
                    'Populer',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Nunito',
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: FutureBuilder(
                future: bookk.getapiData(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // You can return a loading indicator or some placeholder widget here
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    // Handle the error case
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          var book = snapshot.data![index];
                          return GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return BookDetail(
                                      item: book,
                                    );
                                  },
                                ));
                              },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 8),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network(
                                      book.photo,
                                      width: 100,
                                      height: 150,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          book.autor,
                                          style: TextStyle(
                                            fontFamily: "Nunito",
                                            fontSize: 10,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          book.title,
                                          style: TextStyle(
                                            fontFamily: "Nunito",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        SizedBox(height: 4),
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
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
