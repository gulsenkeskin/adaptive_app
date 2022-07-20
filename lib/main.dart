import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ResizeablePage(),
    );
  }
}

class ResizeablePage extends StatefulWidget {
  const ResizeablePage({Key? key}) : super(key: key);

  @override
  State<ResizeablePage> createState() => _ResizeablePageState();
}

class _ResizeablePageState extends State<ResizeablePage> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final themePlatform = Theme.of(context).platform;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Windown properties",
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width: 350,
              child: Table(
                textBaseline: TextBaseline.alphabetic,
                children: [
                  _fillTableRow(
                      context: context,
                      property: "Window Size",
                      value: "${mediaQuery.size.width.toStringAsFixed(1)} x "
                          "${mediaQuery.size.height.toStringAsFixed(1)}"),
                  
                  _fillTableRow(context: context, property: "Cihaz Piksel Oranı", value: mediaQuery.devicePixelRatio.toStringAsFixed(2)),
                  _fillTableRow(context: context, property: "Platform.isXXX", value: platformDescription()),
                  
                  _fillTableRow(context: context, property: 'Theme.of(ctx).platform', value: themePlatform.toString())
                  
                  
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  TableRow _fillTableRow(
      {required BuildContext context,
      required String property,
      required String value}) {
    return TableRow(children: [
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.baseline,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(property),
        ),
      ),
      TableCell(
          verticalAlignment: TableCellVerticalAlignment.baseline,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(value),
          ))
    ]);
  }

  String platformDescription() {
    if (kIsWeb) {
      return 'Web';
    } else if (Platform.isAndroid) {
      return 'Android';
    } else if (Platform.isIOS) {
      return 'iOS';
    } else if (Platform.isWindows) {
      return 'Windows';
    } else if (Platform.isMacOS) {
      return 'macOS';
    } else if (Platform.isLinux) {
      return 'Linux';
    } else if (Platform.isFuchsia) {
      return 'Fuchsia';
    } else {
      return 'Unknown';
    }
  }
}
