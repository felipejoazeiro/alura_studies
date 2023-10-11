import 'package:mobx/mobx.dart';

part 'carrinho_store.g.dart';

class CarrinhoStore = _CarrinhoStore with _$CarrinhoStore;

abstract class _CarrinhoStore with Store {
  @observable
  int quantidadeCarrinho = 0;

  @action
  void adicionaItemCarrinho() {
    quantidadeCarrinho++;
  }

  @action
  void adicionaListaItensCarrinho(int n) {
    quantidadeCarrinho = quantidadeCarrinho + n;
  }

  @action
  removeItemCarrinho() {
    quantidadeCarrinho--;
  }
}
