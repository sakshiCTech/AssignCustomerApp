import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'root_logic.dart';

class RootPage extends GetView<RootPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                var box = GetStorage();
                box.remove('on_boarding');
              },
              child: Text('Remove OnBoarding'))),
    );
  }
}
