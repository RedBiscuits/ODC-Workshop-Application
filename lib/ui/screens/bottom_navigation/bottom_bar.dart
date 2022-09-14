import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/ui/screens/bottom_navigation/bottom_cubit.dart';
import 'package:login/ui/screens/components/bottom_navigation_item.dart';

import 'bottom_state.dart';


class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavigationCubit,NavigationStates>(
      listener: (context,state) {} ,
      builder: (context,state) {
        NavigationCubit cubit = NavigationCubit.get(context);
        return Scaffold(
            body: cubit.screens[cubit.chosenPageIndex],
            bottomNavigationBar: BottomNavyBar(
              selectedIndex: cubit.chosenPageIndex,
              showElevation: true,
              onItemSelected: (index){
                cubit.navigate(index);
              },
              items: [
                getBottomItem(Icons.home_outlined, 'Home'),
                getBottomItem(Icons.newspaper_outlined, 'News'),
                getBottomItem(Icons.settings_outlined, 'Settings'),
              ],
            )
        );
      },
    );
  }
}