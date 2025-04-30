import 'package:flutter/material.dart';
// ignore: must_be_immutable

import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class MyWebLoader extends StatefulWidget {
  final String url;
  final String title;

  const MyWebLoader(this.url, this.title, {super.key});

  @override
  State<MyWebLoader> createState() => _MyWebLoaderState();
}

class _MyWebLoaderState extends State<MyWebLoader> {
  double _progress = 0; // Track loading progress

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(url: WebUri(widget.url)),
            onProgressChanged: (controller, progress) {
              setState(() {
                _progress = progress / 100; // Convert to 0.0 - 1.0 range
              });
            },
          ),
          if (_progress < 1.0)
            LinearProgressIndicator(value: _progress), // Show loading bar
        ],
      ),
    );
  }
}
