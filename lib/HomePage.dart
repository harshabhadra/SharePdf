import 'package:flutter/material.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:typed_data';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future sharePdf() async {
    final ByteData bytes = await rootBundle.load('assets/sample.pdf');
    await Share.file(
        'esys pdf', 'sample.pdf', bytes.buffer.asUint8List(), '*/*');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pdf Share'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: sharePdf,
          child: Text('Share'),
        ),
      ),
    );
  }
}
