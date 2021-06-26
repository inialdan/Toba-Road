import 'package:flutter/material.dart';

void main() {
  const PrimaryColor = const Color(0xff2ca108);

  runApp(MaterialApp(
    title: 'Toba Road',
    theme: ThemeData(
      primaryColor: PrimaryColor,
    ),
    home: MyApp(),
  ));
}

class TobaDestination {
  final int id;
  final String title;
  final String location;
  final String description;
  final String imglink;
  const TobaDestination(
      {this.id, this.title, this.location, this.description, this.imglink});
}

List<TobaDestination> data = const <TobaDestination>[
  const TobaDestination(
      id: 1,
      title: 'Wisata Alam Lembah bakkara',
      location: 'Kabupaten Humbang Hasundutan, Kecamatan Baktiraja, Sumatera Utara',
      description:
          'Tempat ini dibelah oleh dua aliran sungai besar yang berair deras. Sungai terbesar yang dominan adalah Aek Silang yang bersumber dari air terjun yang tercurah dari bentangan perbukitan. Sungai kedua yang lebih kecil bernama Aek Simangira. Keduanya mengaliri beberapa desa dan bermuara di Danau Toba.',
      imglink:
          'https://img.okezone.com/content/2018/01/11/406/1843459/lembah-bakara-ketika-pesona-alam-bersanding-dengan-warisan-masa-lalu-HiSKjFZBaf.jpg'),
  const TobaDestination(
      id: 2,
      title: 'Air Terjun Situmurun Binangalom',
      location: 'Desa Binangalom, Kecamatan Lumban Julu, Kabupaten Toba Samosir, Sumatera Utara',
      description:
          ': Jika dari Medan maka anda harus menuju kota Parapat terlebih dahulu menggunakan kendaraan umum (bus) seperti Intra atau Sejahtera kurang lebih 6 jam dengan biaya Rp25.000 – Rp35.000; ataupun menyewa kendaraan pribadi (mobil) kemudian dari Parapat anda lanjutkan perjalanan ke Pelabuhan Ajibata.',
      imglink:
          'https://ksmtour.com/media/images/articles14/air-terjun-situmurun-binangalom-sumatera-utara.jpg'),
  const TobaDestination(
      id: 3,
      title: 'Bukit Gibeon',
      location: 'Desa Gibeon Samosir ',
      description:
          'Di sekitar bukit Gibeon terdapat bangunan sebagai pusat seminari Bukit Gibeon yang telah diresmikan pada bulan Mei 2016 dengan tujuan sebagai salah satu pusat pembelajaran untuk missionaris dan generasi  bangsa. Pusat seminari Bukit Gibeon sebenarnya merupakan tempat sekolah missionaris/ sekolah Pendeta, namun sering sekali tempat ini dijadikan menjadi tujuan destinasi keluarga, retreat & tempat beribadah.',
      imglink:
          'https://tourtoba.com/wp-content/uploads/2017/11/bukit-gibeon-final-1.jpg'),
  const TobaDestination(
      id: 4,
      title: 'Wisata Kuliner Widya Restaurant',
      location: 'Lokasi strategis, yakni sangat dekat dengan Danau Toba',
      description:
          'Memiliki suasana yang nyaman sekaligus sangat menenangkan karena lokasinya yang strategis, yakni sangat dekat dengan Danau Toba. Konsep restoran dari aspek dekorasinya banyak menggunakan furnitur.',
      imglink:
          'https://www.andalastourism.com/wp-content/uploads/2020/10/Maruba-Restaurant.jpg'),
  const TobaDestination(
      id: 5,
      title: 'Tabo Hian Resto',
      location: 'Lokasi strategis, yakni sangat dekat dengan Danau Toba',
      description:
          'Beralamat di desa aek nation restoran ini sangat khas dengan jenis makanan dengan proses di panggang dan di bakar berbagai  jenis ikan yang di dapat langsung dari keramba danau toba jadi sangat segar.',
      imglink:
          'https://i2.wp.com/makanmana.net/wp-content/uploads/2008/03/onma-tabo.jpg?fit=700%2C525&ssl=1'),
];

class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    final title = "Toba Road";
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: new ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            children: List.generate(data.length, (index) {
              return Center(
                child: TobaCard(choice: data[index], item: data[index]),
              );
            })));
  }
}

class TobaCard extends StatelessWidget {
  const TobaCard(
      {Key key,
      this.choice,
      this.onTap,
      @required this.item,
      this.selected: false})
      : super(key: key);
  final TobaDestination choice;
  final VoidCallback onTap;
  final TobaDestination item;
  final bool selected;
  @override

  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.display1;
    if (selected)
      textStyle = textStyle.copyWith(color: Colors.lightGreenAccent[400]);
    return FlatButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    TobaReadPage(index: data.indexOf(choice))));
      },
      child: Card(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              new Container(
                  padding: const EdgeInsets.all(0),
                  child: Image.network(choice.imglink)),
              new Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(choice.title,
                        style: Theme.of(context).textTheme.title),
                    Text(choice.location,
                        style: TextStyle(color: Colors.black.withOpacity(0.5))),
                    Text(choice.description.substring(0, 100) + '...'),
                  ],
                ),
              )
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          )),
    );
  }
}

class TobaReadPage extends StatelessWidget {
  final int index;
  const TobaReadPage({Key key, this.index}) : super(key: key);
  @override

  Widget build(BuildContext context) {
    return Center(
      child: TobaCardRead(choice: data[index]),
    );
  }
}

class TobaCardRead extends StatelessWidget {
  const TobaCardRead({Key key, this.choice}) : super(key: key);
  final TobaDestination choice;
  @override

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Card(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                new Container(
                    padding: const EdgeInsets.all(0),
                    child: Image.network(choice.imglink)),
                new Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(choice.title,
                          style: Theme.of(context).textTheme.title),
                      Text(choice.location,
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.5))),
                      Text(choice.description),
                    ],
                  ),
                )
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            )),
      ),
    );
  }
}
