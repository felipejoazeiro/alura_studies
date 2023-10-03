import 'dart:math';

asyncStudy() {
  esperandoFuncoesAssincronas();
}

void execucaoNormal() {
  print("/n Execução normal");
  print("01");
  print("02");
  print("03");
  print("04");
  print("05");
}

void assincronismoBasico() {
  print("/n Execução normal");
  print("01");
  print("02");
  Future.delayed(Duration(seconds: 2), () {
    print("03");
  });
  print("04");
  print("05");
}

void usandoFuncoesAssincronas() async {
  print("\nExecução normal");
  print("01");
  print("02");
  getRandomInt(1).then((value) {
    print(value);
  });
  print("04");
  print("05");
}

void esperandoFuncoesAssincronas() async {
  print("\nExecução normal");
  print("01");
  print("02");
  int number = await getRandomInt(2);
  print("O número aleatório é $number.");
  print("04");
  print("05");
}

Future<int> getRandomInt(int time) async {
  await Future.delayed(Duration(seconds: time));
  Random rng = Random();
  return rng.nextInt(10);
}
