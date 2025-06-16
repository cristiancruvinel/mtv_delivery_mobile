import 'package:flutter/material.dart';
import '../models/produto.dart';

class CarrinhoProvider with ChangeNotifier {
  final Map<String, int> _itensQuantidade = {};
  final Map<String, Produto> _produtos = {};

  Map<Produto, int> get itens {
    return _itensQuantidade.map(
      (id, qtd) => MapEntry(_produtos[id]!, qtd),
    );
  }

  void adicionarProduto(Produto produto) {
    if (_itensQuantidade.containsKey(produto.id)) {
      _itensQuantidade[produto.id] = _itensQuantidade[produto.id]! + 1;
    } else {
      _itensQuantidade[produto.id] = 1;
      _produtos[produto.id] = produto;
    }
    notifyListeners();
  }

  void removerUmaUnidade(Produto produto) {
    if (_itensQuantidade.containsKey(produto.id)) {
      final atual = _itensQuantidade[produto.id]!;
      if (atual > 1) {
        _itensQuantidade[produto.id] = atual - 1;
      } else {
        removerProduto(produto);
      }
      notifyListeners();
    }
  }

  void removerProduto(Produto produto) {
    _itensQuantidade.remove(produto.id);
    _produtos.remove(produto.id);
    notifyListeners();
  }

  int get quantidade =>
      _itensQuantidade.values.fold(0, (soma, qtd) => soma + qtd);

  double get total => itens.entries
      .fold(0.0, (soma, e) => soma + e.key.preco * e.value);

  void limpar() {
    _itensQuantidade.clear();
    _produtos.clear();
    notifyListeners();
  }
}
