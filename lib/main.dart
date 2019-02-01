import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission/permission.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Permissions Demo'),
        ),
        body: new Center(
          child: new RaisedButton(
            onPressed: permission,
            child: new Text('Request Permission'),
          ),
        ),
      ),
    );
  }

  permission() {
    if (Platform.isAndroid) {
      requestPermissionsAndroid();
    } else {
      requestPermissionIOS();
    }
  }

  requestPermissionsAndroid() async {
    List<PermissionName> permissionNames = [];
    permissionNames.add(PermissionName.Microphone);
    permissionNames.add(PermissionName.Location);
    await Permission.requestPermissions(permissionNames);
  }

  requestPermissionIOS() async {
    await Permission.requestSinglePermission(PermissionName.Microphone);
    await Permission.requestSinglePermission(PermissionName.Location);
  }
}
