import 'package:dicoding_final_flutterpemula/views/img_views.dart';
import 'package:flutter/material.dart';

import '../model/wallpaper_model.dart';

Widget brandName() {
  return RichText(
    text: const TextSpan(
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      children: <TextSpan>[
        TextSpan(
          text: 'By ',
          style: TextStyle(color: Color.fromARGB(255, 111, 248, 173)),
        ),
        TextSpan(
          text: 'Wallpaper',
          style: TextStyle(color: Colors.black87),
        ),
      ],
    ),
  );
}

// ignore: non_constant_identifier_names
Widget WallpaperList({required List<WallpaperModel> wallpaper, context}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child: GridView.count(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: wallpaper.map((wallpaper) {
        return GridTile(
            child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ImageViews(
                          imgUrl: wallpaper.src!.portrait,
                        )));
          },
          child: Hero(
            tag: wallpaper.src!.portrait,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.network(
                wallpaper.src!.portrait,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ));
      }).toList(),
    ),
  );
}
