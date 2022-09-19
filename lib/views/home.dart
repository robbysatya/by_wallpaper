import 'dart:convert';

import 'package:dicoding_final_flutterpemula/data/data.dart';
import 'package:dicoding_final_flutterpemula/model/wallpaper_model.dart';
import 'package:dicoding_final_flutterpemula/views/search.dart';
import 'package:dicoding_final_flutterpemula/widget/widget.dart';
import 'package:flutter/material.dart';

import '../model/kategori_model.dart';
import 'package:http/http.dart' as http;

import 'kategori.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<KategoriModel> kategori = [];
  List<WallpaperModel> wallpaper = [];

  TextEditingController searchController = TextEditingController();

  var url = Uri.parse('https://api.pexels.com/v1/curated?per_page=50&page=1');

  getTrendWallpapers() async {
    var response = await http.get(url, headers: {"Authorization": apiKey});
    // print(response.body.toString());
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element) {
      // print(element);
      WallpaperModel wallpaperModel = WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      wallpaper.add(wallpaperModel);
    });

    setState(() {});
  }

  @override
  void initState() {
    getTrendWallpapers();
    kategori = getKategori();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: brandName(),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 238, 238, 238),
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      decoration: const InputDecoration(
                          hintText: "Search", border: InputBorder.none),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Search(
                                    searchQuery: searchController.text,
                                  )));
                    },
                    child: const Icon(Icons.search),
                  )
                ],
              ),
            ),
            const SizedBox(height: 16),
            // ignore: sized_box_for_whitespace
            Container(
              height: 80,
              child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  scrollDirection: Axis.horizontal,
                  itemCount: kategori.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return KategoriBase(
                      title: kategori[index].kategoriName,
                      imgUrl: kategori[index].imgUrl,
                    );
                  }),
            ),
            WallpaperList(wallpaper: wallpaper, context: context),
          ],
        ),
      ),
    );
  }
}

class KategoriBase extends StatelessWidget {
  final String imgUrl, title;
  const KategoriBase({super.key, required this.imgUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    Kategori(kategoriName: title.toLowerCase())));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 4),
        child: Stack(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.network(
                  imgUrl,
                  height: 60,
                  width: 120,
                  fit: BoxFit.cover,
                )),
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Container(
                  color: Colors.black45,
                  height: 60,
                  width: 120,
                  alignment: Alignment.center,
                  child: Text(title,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold))),
            ),
          ],
        ),
      ),
    );
  }
}
