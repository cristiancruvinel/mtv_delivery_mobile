import 'package:flutter/material.dart';
import '../models/pedido.dart';

class HistoricoProvider with ChangeNotifier {
  final List<Pedido> _pedidos = [];

  List<Pedido> get pedidos => List.unmodifiable(_pedidos);

  void adicionarPedido(List<Map<String, dynamic>> itens, double total) {
    _pedidos.insert(
      0,
      Pedido(itens: itens, total: total, data: DateTime.now()),
    );
    notifyListeners();
  }
}
