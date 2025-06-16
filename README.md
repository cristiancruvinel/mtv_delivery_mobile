# 📱 MTV Delivery Mobile

Aplicativo Flutter para realização de pedidos em um restaurante virtual. Este é o módulo mobile do sistema MTV Delivery, voltado para clientes finais realizarem seus pedidos com praticidade.

---

## 🧩 Funcionalidades

- 📋 **Cardápio com imagens** dos produtos
- 🛒 **Carrinho de compras interativo**
  - Adição, remoção e alteração de quantidade
- ✅ **Finalização de pedido**
  - Formulário com nome, telefone e endereço
  - Dados salvos automaticamente com `SharedPreferences`
- 📜 **Histórico de pedidos**
  - Lista de pedidos já realizados
- 👤 **Tela de perfil**
  - Edição de dados do cliente
  - Exibição de avatar personalizado

---

## 🧱 Estrutura do Projeto

- `lib/screens`: Telas principais (Cardápio, Carrinho, Finalização, Histórico, Perfil, Navegação)
- `lib/models`: Modelo de dados (`Produto`, `Pedido`)
- `lib/providers`: Gerenciamento de estado com `Provider`
- `assets/images`: Imagens dos itens do cardápio e avatar do perfil
- `pubspec.yaml`: Dependências e configurações

---

## 🚀 Tecnologias Utilizadas

- [Flutter](https://flutter.dev/)
- [Dart](https://dart.dev/)
- `provider` para gerenciamento de estado
- `shared_preferences` para armazenamento local

---

## 🖼️ Imagens dos Itens

Certifique-se de que as seguintes imagens estejam na pasta `assets/images/`:

| Produto             | Nome do Arquivo           |
|---------------------|----------------------------|
| Pizza               | `pizza.png`               |
| Macarronada         | `macarronada.png`         |
| Hamburguer          | `hamburguer.png`          |
| Brownie com Sorvete | `brownie_sorvete.png`     |
| Suco de Laranja     | `suco_laranja.png`        |
| Avatar do Perfil    | `avatar.png`              |

---

## 📦 Como Rodar o Projeto

1. Clone o repositório:

```bash
git clone https://github.com/seu-usuario/mtv_delivery_mobile.git
cd mtv_delivery_mobile
```

2. Instale as dependências:

```bash
flutter pub get
```

3. Rode o app:

```bash
flutter run
```

---

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

---

## 🤝 Contato

Desenvolvido por **Cristian Cauê Faria Cruvinel**

- 📧 Email: cristiancauefariacruvinel@gmail.com
- 💼 LinkedIn: [linkedin.com/in/cristian.cruvinell](https://linkedin.com/in/cristian.cruvinel)

---

> Projeto desenvolvido como parte do sistema MTV Delivery — Módulo Mobile.