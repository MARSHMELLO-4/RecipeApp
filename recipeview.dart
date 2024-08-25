import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RecipeView extends StatefulWidget {
  final String url;

  RecipeView(this.url);

  @override
  State<RecipeView> createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {
  late final WebViewController controller;
  late String finalUrl;

  @override
  void initState() {
    super.initState();
    // Assign the finalUrl correctly based on the condition
    if (widget.url.contains("http://")) {
      finalUrl = widget.url.replaceAll("http://", "https://");
    } else {
      finalUrl = widget.url;
    }

    // Initialize the controller here
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse(finalUrl), // Use the finalUrl here
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Food Recipe App"),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
