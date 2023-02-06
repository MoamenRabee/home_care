import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_care/modules/user/home/user_home_screen.dart';
import 'package:home_care/modules/user/layout/cubit/cubit.dart';
import 'package:home_care/modules/user/layout/cubit/states.dart';
import 'package:home_care/modules/user/layout/widgets/drawer.dart';

class UserLayoutScreen extends StatelessWidget {
  const UserLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LayoutCubit cubit = LayoutCubit.get(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocConsumer<LayoutCubit,LayoutStates>(
        listener: (context,state){},
        builder: (context,state) {
          return Scaffold(
            drawer: MyDrawer(),
            appBar: AppBar(
              title: const Text("# صحتك ـــــ تهمنا"),
              centerTitle: true,
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar:  ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              child: BottomNavigationBar(
                
                onTap: (int index){
                  cubit.changeLayoutScreen(index);
                },
                
                currentIndex: cubit.currentIndex,
                elevation: 3,
                items: cubit.bottomNavigationBarItems,
              ),
            ),
          );
        }
      ),
      
    );
    
  }
}
