import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/produtos_mock.dart';
import '../widgets/produto_card.dart';
import '../providers/carrinho_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final carrinho = Provider.of<CarrinhoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cardápio'),
      ),
      body: ListView.builder(
        itemCount: produtosMock.length,
        itemBuilder: (context, index) {
          final produto = produtosMock[index];
          return ProdutoCard(
            produto: produto,
            onAdicionar: () {
              carrinho.adicionarProduto(produto);
              // feedback visual removido
            },
          );
        },
      ),
    );
  }
}
