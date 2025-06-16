class Pedido {
  final List<Map<String, dynamic>> itens;
  final double total;
  final DateTime data;

  Pedido({required this.itens, required this.total, required this.data});
}
