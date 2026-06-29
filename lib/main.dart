import 'package:flutter/material.dart';

import 'package:layout/layout.dart';

import 'package:nimbus/app_theme.dart';

import 'package:nimbus/presentation/routes/router.dart';

import 'package:nimbus/values/values.dart';



void main() {

  runApp(const Nimbus());

}



class Nimbus extends StatefulWidget {

  const Nimbus({super.key});



  @override

  State<Nimbus> createState() => _NimbusState();

}



class _NimbusState extends State<Nimbus> {

  final AppRouter _appRouter = AppRouter();



  @override

  Widget build(BuildContext context) {

    return Layout(

      child: MaterialApp.router(

        title: StringConst.APP_NAME,

        theme: AppTheme.lightThemeData,

        darkTheme: AppTheme.darkThemeData,

        themeMode: ThemeMode.dark,

        debugShowCheckedModeBanner: false,

        routerConfig: _appRouter.config(),

      ),

    );

  }

}

