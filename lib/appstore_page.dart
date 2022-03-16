import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'menu_home.dart';

class AppStorePage extends StatelessWidget {
  const AppStorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("List Application"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(10)),
            namaAplikasi(),
            Padding(padding: EdgeInsets.all(10)),
            btnList(context),
            Padding(padding: EdgeInsets.all(10)),
            btnClose(context),
          ],
        ),
      ),
    );
  }

  Widget namaAplikasi() {
    return Container(
      child: Column(
        children: [
          Text("Selamat Datang di App Store KW 3",
            style: TextStyle(
            color: Colors.blueAccent,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget btnList(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
            ),
            child: Text("List Aplikasi"),
          ),
        ],
      ),
    );
  }

  Widget btnClose(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: (){
              SystemNavigator.pop();
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
            ),
            child: Text("Exit"),
          ),
        ],
      ),
    );
  }

}