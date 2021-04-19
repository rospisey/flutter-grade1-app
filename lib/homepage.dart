import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:grade1/view_pdf.dart';
import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Future<File> fromAsset(String asset, String filename) async {
  //   // To open from assets, you can copy them to the app storage folder, and the access them "locally"
  //   Completer<File> completer = Completer();

  //   try {
  //     var dir = await getApplicationDocumentsDirectory();
  //     File file = File("${dir.path}/$filename");
  //     var data = await rootBundle.load(asset);
  //     var bytes = data.buffer.asUint8List();
  //     await file.writeAsBytes(bytes, flush: true);
  //     completer.complete(file);
  //   } catch (e) {
  //     throw Exception('Error parsing asset file!');
  //   }

  //   return completer.future;
  // }
  //
  final String assetsPath = kIsWeb ? '' : 'assets/';
  List _data = [];

  List<Map<String, dynamic>> value = [
    {
      'asset': 'pdf/grade-1(1).pdf',
      'image': 'image/grade1-1(1).jpg',
      'name': 'Khmer Literature'
    },
    {
      'asset': 'pdf/grade-1(2).pdf',
      'image': 'image/grade1-1(2).jpg',
      'name': 'Mathematic'
    },
    {
      'asset': 'pdf/grade-1(3).pdf',
      'image': 'image/grade1-1(3).jpg',
      'name': 'Sociology'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: Colors.black.withOpacity(0.7),
          title: Text(
            widget.title,
            textAlign: TextAlign.left,
          ),
        ),
        body: new StaggeredGridView.countBuilder(
          crossAxisCount: 2,
          itemCount: value.length,
          itemBuilder: (BuildContext context, int index) => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                flex: 3,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ViewPDF(
                            path: assetsPath + value[index]['asset'],
                          ))),
                  child: Card(
                    color: Colors.black.withOpacity(0.7),
                    shadowColor: Colors.grey,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Image(
                      fit: BoxFit.contain,
                      image: AssetImage(
                        assetsPath + value[index]['image'],
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Center(
                    child: Text(
                  value[index]['name'],
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
              )
            ],
          ),
          staggeredTileBuilder: (int index) => new StaggeredTile.count(1, 1.5),
          mainAxisSpacing: 0,
          crossAxisSpacing: 0,
        ));
  }
}
