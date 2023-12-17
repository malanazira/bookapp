

import 'package:meta/meta.dart';
import 'dart:convert';


class Book {
    dynamic id;
    String photo;
    String autor;
    String title;
    String rate;
    String tahun;
    String halaman;
    String bahasa;
    String sinopsis;

    Book({
        required this.id,
        required this.photo,
        required this.autor,
        required this.title,
        required this.rate,
        required this.tahun,
        required this.halaman,
        required this.bahasa,
        required this.sinopsis,
    });

    factory Book.fromJson(Map<String, dynamic> json) => Book(
        id: json["id"],
        photo: json["photo"],
        autor: json["autor"],
        title: json["title"],
        rate: json["rate"],
        tahun: json["tahun"],
        halaman: json["halaman"],
        bahasa: json["bahasa"],
        sinopsis: json["sinopsis"],
    );
}
