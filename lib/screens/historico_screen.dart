import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/historico_provider.dart';
import 'package:intl/intl.dart';

class HistoricoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final historico = Provider.of<HistoricoProvider>(context);
    final pedidos = historico.pedidos;

    return Scaffold(
      appBar: AppBar(title: Text('Histórico de Pedidos')),
      body: pedidos.isEmpty
          ? Center(child: Text('Nenhum pedido foi realizado ainda.'))
          : ListView.builder(
              itemCount: pedidos.length,
              itemBuilder: (context, index) {
                final pedido = pedidos[index];
                final dataFormatada =
                    DateFormat('dd/MM/yyyy HH:mm').format(pedido.data);

                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  elevation: 3,
                  child: ListTile(
                    title: Text('Pedido de $dataFormatada'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 4),
                        ...pedido.itens.map((item) => Text(
                              '${item['quantidade']}x ${item['nome']} — R\$ ${item['subtotal'].toStringAsFixed(2)}',
                            )),
                        SizedBox(height: 8),
                        Text('Total: R\$ ${pedido.total.toStringAsFixed(2)}'),
                      ],
                    ),
                    isThreeLine: true,
                  ),
                );
              },
            ),
    );
  }
}
