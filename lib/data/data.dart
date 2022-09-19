import '../model/kategori_model.dart';

String apiKey = "563492ad6f91700001000001d466294f613b47fa85530e662f10890b";

List<KategoriModel> getKategori() {
  List<KategoriModel> kategori = [];
  KategoriModel kategoriModel = KategoriModel();

  kategoriModel.imgUrl =
      "https://images.pexels.com/photos/248547/pexels-photo-248547.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
  kategoriModel.kategoriName = "Sport";
  kategori.add(kategoriModel);
  kategoriModel = KategoriModel();

  kategoriModel.imgUrl =
      "https://images.pexels.com/photos/257816/pexels-photo-257816.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
  kategoriModel.kategoriName = "Food";
  kategori.add(kategoriModel);
  kategoriModel = KategoriModel();

  kategoriModel.imgUrl =
      "https://images.pexels.com/photos/313782/pexels-photo-313782.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
  kategoriModel.kategoriName = "City";
  kategori.add(kategoriModel);
  kategoriModel = KategoriModel();

  kategoriModel.imgUrl =
      "https://images.pexels.com/photos/617278/pexels-photo-617278.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
  kategoriModel.kategoriName = "Animals";
  kategori.add(kategoriModel);
  kategoriModel = KategoriModel();

  kategoriModel.imgUrl =
      "https://images.pexels.com/photos/792345/pexels-photo-792345.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
  kategoriModel.kategoriName = "Gadget";
  kategori.add(kategoriModel);
  kategoriModel = KategoriModel();

  kategoriModel.imgUrl =
      "https://images.pexels.com/photos/1757363/pexels-photo-1757363.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
  kategoriModel.kategoriName = "Nature";
  kategori.add(kategoriModel);
  kategoriModel = KategoriModel();

  return kategori;
}
