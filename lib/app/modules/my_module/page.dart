import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';

class MyModulePage extends GetView<MyModuleController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MyModule')),
      body: Container(),
    );
  }
}
