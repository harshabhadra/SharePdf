import 'dart:io';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';

class Repository {
  // Future downLoadFromUrl(String url) async {
  //   var request = await HttpClient().getUrl(Uri.parse(url));
  //   var response = await request.close();
  //   Uint8List bytes = await consolidateHttpClientResponseBytes(response);
  //   await Share.file('ESYS AMLOG', 'amlog.pdf', bytes, '*/*');

  // }

  Future urlFileShare(String url) async {
   
      var response = await get(url);
      final documentDirectory = (await getExternalStorageDirectory()).path;
      File imgFile = new File('$documentDirectory/flutter.pdf');
      imgFile.writeAsBytesSync(response.bodyBytes);

      Share.shareFiles(
        ['$documentDirectory/flutter.pdf'],
        subject: 'URL File Share',
        text: 'Hello, check your share files!',
      );
  }
}
