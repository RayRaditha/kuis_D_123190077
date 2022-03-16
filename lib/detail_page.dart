import 'package:flutter/material.dart';
import 'package:store_redirect/store_redirect.dart';

import 'app_store.dart';


class DetailPage extends StatelessWidget {
  final String nama_app;
  final String logo;
  final String nama_dev;
  final String genre_game;
  final String rating_game;
  final String desc_game;
  final String link_app;

  const DetailPage({Key? key,
    required this.nama_app,
    required this.logo,
    required this.nama_dev,
    required this.genre_game,
    required this.rating_game,
    required this.desc_game,
    required this.link_app})
      : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Detail Aplikasi'),
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            detailApp(),
            detailInfoApp(),
            deskripsiApp(),
            btnDownload(context),
          ],
        ),
      ),
    );
  }

  Widget detailApp() {
    return InkWell(
      onTap: () {},
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(10),
        child: Row(
          children: [
            Image.network(logo, width: 120),
            const Padding(
              padding: EdgeInsets.all(20),
            ),
            Text(
              nama_app, style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget detailInfoApp() {
    return Container(
      padding: EdgeInsets.only(
        left: 50,
        top: 20,
        right: 50,
        bottom: 20,
      ),
      child: Column(
        children: [
          const Padding(padding: EdgeInsets.all(10)),
          Text("Developer : " + nama_dev),
          Text("Genre game : " + genre_game),
          Text("Rating : " + rating_game),
          const Padding(padding: EdgeInsets.all(10)),
        ],
      ),
    );
  }

  Widget deskripsiApp() {
    return Container(
      padding: EdgeInsets.only(
        left: 30,
        top: 10,
        right: 30,
        bottom: 10,
      ),
      child: Column(
        children: [
          const Padding(padding: EdgeInsets.all(10)),
          Text(desc_game),
          const Padding(padding: EdgeInsets.all(10)),
        ],
      ),
    );
  }

  Widget btnDownload(BuildContext context) {
    return Column(
      children: [
        const Padding(
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 30)),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple.shade300),
          ),
          onPressed: () {
            StoreRedirect.redirect(
              androidAppId: link_app,
            );
          },

          child: const Text('Download'),
        ),
      ],
    );
  }
}