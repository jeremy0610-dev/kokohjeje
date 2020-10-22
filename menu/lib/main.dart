import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final title = "JEAR Florist";

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: GridView.count(
          crossAxisCount: 3,
          children: List.generate(menus.length, (index) {
            return Center(
              child: MenuCard(menu: menus[index])
            );
          }),
        ),
      ),
    );
  }
}

class Menu {
  const Menu({this.title, this.icon});

  final String title;
  final String icon;
}

const List<Menu> menus = const [
  const Menu(title: "Tanaman Hias", icon: "gambar/tanamanhias.png"),
  const Menu(title: "Bunga", icon: "gambar/bunga.png"),
  const Menu(title: "Bibit Buah", icon: "gambar/bibitbuah.png"),
  const Menu(title: "Bibit Sayuran", icon: "gambar/bibitsayuran.png"),
  const Menu(title: "Pupuk", icon: "gambar/pupuk.png"),
  const Menu(title: "Pot Tanaman", icon: "gambar/pottanaman.png"),
  const Menu(title: "Peralatan Kebun", icon: "gambar/peralatankebun.png"),
 
  
];

class MenuCard extends StatelessWidget {
  const MenuCard({Key key, this.menu}) : super(key: key);

  final Menu menu;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          _showDialog(context, menu);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.all(10),),
            Expanded(
              child: 
                Image.asset(menu.icon, height: 100.0, width: 100.0, fit: BoxFit.contain,)
            ),
            Text(menu.title, style: TextStyle(fontSize: 12.0)),
            Padding(padding: EdgeInsets.all(10),),
          ]
        ),
      ),
    );
  }

  void _showDialog(BuildContext context, Menu menu) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Keterangan"),
          content: new Text("Ini menu " + menu.title),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Tutup"),
              onPressed: () {
                Navigator.of(context).pop();
              }, 
            )
          ],
        );
      }
    );
  }

  
}

