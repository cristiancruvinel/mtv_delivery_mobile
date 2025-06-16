import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../providers/carrinho_provider.dart';
import '../providers/historico_provider.dart';

class FinalizarPedidoScreen extends StatefulWidget {
  final VoidCallback? onPedidoFinalizado;

  FinalizarPedidoScreen({this.onPedidoFinalizado});

  @override
  _FinalizarPedidoScreenState createState() => _FinalizarPedidoScreenState();
}

class _FinalizarPedidoScreenState extends State<FinalizarPedidoScreen> {
  String nomeCliente = '';
  String telefoneCliente = '';
  String enderecoCliente = '';

  @override
  void initState() {
    super.initState();
    _carregarDadosCliente();
  }

  Future<void> _carregarDadosCliente() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      nomeCliente = prefs.getString('nome') ?? '';
      telefoneCliente = prefs.getString('telefone') ?? '';
      enderecoCliente = prefs.getString('endereco') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final carrinho = Provider.of<CarrinhoProvider>(context);
    final historico = Provider.of<HistoricoProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: Text('Finalizar Pedido')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Nome'),
              controller: TextEditingController(text: nomeCliente),
              onChanged: (value) => nomeCliente = value,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Telefone'),
              controller: TextEditingController(text: telefoneCliente),
              onChanged: (value) => telefoneCliente = value,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Endereço'),
              controller: TextEditingController(text: enderecoCliente),
              onChanged: (value) => enderecoCliente = value,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.setString('nome', nomeCliente);
                await prefs.setString('telefone', telefoneCliente);
                await prefs.setString('endereco', enderecoCliente);

                final itens = carrinho.itens.entries.map((e) {
                  return {
                    'nome': e.key.nome,
                    'quantidade': e.value,
                    'subtotal': e.key.preco * e.value,
                  };
                }).toList();

                historico.adicionarPedido(itens, carrinho.total);
                carrinho.limpar();

                widget.onPedidoFinalizado?.call();
              },
              child: Text('Confirmar Pedido'),
            ),
          ],
        ),
      ),
    );
  }
}
