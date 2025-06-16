import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/splash_screen.dart';
import 'providers/carrinho_provider.dart';
import 'providers/historico_provider.dart';

void main() {
  runApp(MtvDeliveryApp());
}

class MtvDeliveryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CarrinhoProvider()),
        ChangeNotifierProvider(create: (_) => HistoricoProvider()),
      ],
      child: MaterialApp(
        title: 'MtvDelivery',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          scaffoldBackgroundColor: Color(0xFFFDF4F5),
        ),
        home: SplashScreen(),
      ),
    );
  }
}
