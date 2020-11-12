import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'Repository.dart';

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

  @override
  Widget build(BuildContext context) {
    Repository repository = Repository();
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
                setState(() {
                  showLoading = true;
                });
                repository.urlFileShare(
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
