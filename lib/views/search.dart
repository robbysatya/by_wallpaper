import 'dart:convert';
import 'dart:io';

import 'package:dicoding_final_flutterpemula/data/data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/wallpaper_model.dart';
import '../widget/widget.dart';

class Search extends StatefulWidget {
  final String searchQuery;

  const Search({
    super.key,
    required this.searchQuery,
  });

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchController = TextEditingController();

  List<WallpaperModel> wallpaper = [];

  getSearchdWallpapers(String query) async {
    var response = await http.get(
        Uri.parse(
            "https://api.pexels.com/v1/search?query=$query&per_page=50&page=1"),
        headers: {HttpHeaders.authorizationHeader: apiKey});
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
    getSearchdWallpapers(widget.searchQuery);
    super.initState();
    searchController.text = widget.searchQuery;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: brandName(),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: <Widget>[
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
                      getSearchdWallpapers(searchController.text);
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
            WallpaperList(wallpaper: wallpaper, context: context),
          ],
        ),
      ),
    );
  }
}
