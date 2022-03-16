import 'package:flutter/material.dart';

import 'app_store.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade300,
        title: const Text("Home Page"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: appListCard(),
      ),
    );
  }

  Widget appListCard() {
    var dataApp = getAllApp();

    return ListView.separated(
      itemBuilder: (context, index) {
        return appCard(dataApp[index], context);
      },
      itemCount: dataApp.length,
      separatorBuilder: (context, index) {
        return Container(
          color: Colors.grey,
          height: 1,
          margin: const EdgeInsets.symmetric(vertical: 4),
        );
      },
    );
  }

  Widget appCard(AppStore data, BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DetailPage(
                nama_app: data.name,
                logo: data.imageLogo,
                nama_dev: data.developer,
                genre_game: data.genre,
                rating_game: data.rating,
                desc_game: data.description,
                link_app: data.appLink);
          }));
        },
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Image.network(data.imageLogo),
            ),
            Expanded(
              flex: 2,
              child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  child: Text(data.name)),
            ),
          ],
        ),
      ),
    );
  }
}