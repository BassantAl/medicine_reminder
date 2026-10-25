import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicine_reminder/core/constants/assets.dart';
import 'package:medicine_reminder/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:medicine_reminder/generated/l10n.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: SvgPicture.asset(Assets.resourceImagesAppIcon),
        centerTitle: false,
        title: Text(S.of(context).appName + S.of(context).appName1,),
      ),
      body:HomeViewBody() ,
      floatingActionButton: FloatingActionButton(onPressed: (){} ,child: Icon(Icons.add),),
    );
  }
}