import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  var isLoading = true;
  final _key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     "Privacy Policy",
      //     style: TextStyle(fontWeight: FontWeight.bold),
      //   ),
      // ),
      body: Stack(children: [
        WebViewWidget(
          key: _key,
          controller: WebViewController()
            ..setJavaScriptMode(JavaScriptMode.unrestricted)
            ..setNavigationDelegate(NavigationDelegate(
              onPageStarted: (String url) => {},
              onPageFinished: (String url) => {
                if (isLoading)
                  {
                    setState(() {
                      isLoading = false;
                    })
                  }
              },
            ))
            ..loadRequest(Uri.parse('https://kanerika.com/privacy-policy/')),
        ),
        if (isLoading)
          const Center(
            child: CircularProgressIndicator(),
          ),
      ]),
    );
  }
}
