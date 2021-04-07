import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:grade1/view_pdf.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

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
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              childAspectRatio: 1,
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ViewPDF(
                            path: assetsPath + 'pdf/grade-1(1).pdf',
                          ))),
                  child: Card(
                    color: Colors.black.withOpacity(0.7),
                    shadowColor: Colors.grey,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    child: Image(
                      image: AssetImage(assetsPath + 'image/grade1-1(1).jpg'),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ViewPDF(
                            path: assetsPath + 'pdf/grade-1(2).pdf',
                          ))),
                  child: Card(
                    color: Colors.black.withOpacity(0.7),
                    shadowColor: Colors.grey,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    child: Image(
                      image: AssetImage(assetsPath + 'image/grade1-1(2).jpg'),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ViewPDF(
                            path: assetsPath + 'pdf/grade-1(3).pdf',
                          ))),
                  child: Card(
                    color: Colors.black.withOpacity(0.7),
                    shadowColor: Colors.grey,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    child: Image(
                      image: AssetImage(assetsPath + 'image/grade1-1(3).jpg'),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
