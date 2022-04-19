import 'package:flutter/material.dart';
import 'package:movies_app/providers/movies_provider.dart';

import 'package:movies_app/screens/screens.dart';
import 'package:provider/provider.dart';

void main() => runApp(const _AppState());

class _AppState extends StatelessWidget {
  const _AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MoviesProvider(),
          lazy: false,
        )
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home': (_) => const HomeScreen(),
        'details': (_) => const DetailsScreen()
      },
      theme: ThemeData.light().copyWith(
          appBarTheme: AppBarTheme(color: Colors.red[900], elevation: 0)),
    );
  }
}
