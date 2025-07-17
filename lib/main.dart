import 'package:flutter/material.dart';
import 'package:suitmedia_test/screen/first_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'providers/user_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => UserProvider(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Suitmedia Test App',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: const FirstPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
