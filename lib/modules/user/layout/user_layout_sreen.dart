import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:home_care/modules/user/layout/widgets/drawer.dart';

class UserLayoutScreen extends StatelessWidget {
  const UserLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          title: const Text("# صحتك ـــــ تهمنا"),
          centerTitle: true,
        ),
        body: const Center(
          child: Text("HoeCare"),
        ),
      ),
    );
  }
}
