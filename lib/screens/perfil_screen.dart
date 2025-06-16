import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PerfilScreen extends StatefulWidget {
  @override
  _PerfilScreenState createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _enderecoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _carregarDados();
  }

  Future<void> _carregarDados() async {
    final prefs = await SharedPreferences.getInstance();
    _nomeController.text = prefs.getString('nome') ?? '';
    _telefoneController.text = prefs.getString('telefone') ?? '';
    _enderecoController.text = prefs.getString('endereco') ?? '';
  }

  Future<void> _salvarDados() async {
    if (_formKey.currentState!.validate()) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('nome', _nomeController.text);
      await prefs.setString('telefone', _telefoneController.text);
      await prefs.setString('endereco', _enderecoController.text);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Dados salvos com sucesso!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Perfil')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // ✅ Avatar exibido corretamente
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/imagens/avatar.png'),
              backgroundColor: Colors.grey.shade200,
            ),
            const SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  _buildCampo('Nome', _nomeController),
                  const SizedBox(height: 12),
                  _buildCampo('Telefone', _telefoneController, tipo: TextInputType.phone),
                  const SizedBox(height: 12),
                  _buildCampo('Endereço', _enderecoController),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _salvarDados,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        padding: EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text('Salvar', style: TextStyle(fontSize: 16)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCampo(String label, TextEditingController controller, {TextInputType tipo = TextInputType.text}) {
    return TextFormField(
      controller: controller,
      keyboardType: tipo,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      validator: (value) => value!.isEmpty ? 'Digite seu $label' : null,
    );
  }
}
