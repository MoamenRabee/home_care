import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/assets.dart';
import '../theme/theme.dart';

class MyScaffold extends StatelessWidget {
  MyScaffold({
    super.key,
    this.actions,
    this.leading,
    required this.title,
    required this.body,
  });

  Widget? leading;
  List<Widget>? actions;
  Widget title;
  Widget body;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: leading,
              actions: actions,
              centerTitle: true,
              backgroundColor: MyColors.mainColor,
              pinned: true,
              floating: true,
              expandedHeight: 150,
              flexibleSpace: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                child: Container(
                  color: MyColors.mainColor,
                  child: SizedBox(
                    width: double.infinity,
                    height: 180,
                    child: Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Align(
                              alignment: Alignment.center,
                              child: SvgPicture.asset(
                                Assets.logo,
                                width: 200,
                                height: 200,
                                color: Colors.white.withOpacity(0.05),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 17),
                            child: title,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: body,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
