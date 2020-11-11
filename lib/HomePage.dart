import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'dart:async';
import 'dart:typed_data';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showLoading = false;

  @override
  void initState() {
    super.initState();
    showLoading = false;
  }

  Future downLoadFromUrl(String url) async {
    setState(() {
      showLoading = true;
    });
    var request = await HttpClient().getUrl(Uri.parse(url));
    var response = await request.close();
    Uint8List bytes = await consolidateHttpClientResponseBytes(response);
    sharePdf(bytes);
  }

  Future sharePdf(Uint8List bytes) async {
    setState(() {
      showLoading = false;
    });
    await Share.file('ESYS AMLOG', 'amlog.pdf', bytes, '*/*');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pdf Share'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          showLoading
              ? Container(
                  child: CircularProgressIndicator(),
                )
              : Container(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              onPressed: () {
                downLoadFromUrl(
                    'https://www.maa.org/external_archive/devlin/LockhartsLament.pdf');
              },
              child: Text('Share'),
            ),
          ),
        ],
      ),
    );
  }
}
