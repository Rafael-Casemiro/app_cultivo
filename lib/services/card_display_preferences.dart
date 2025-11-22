import 'package:shared_preferences/shared_preferences.dart';

class CardDisplayPreferences {
  static const _key = 'ativarGridView';

  // Salva a preferência
  Future<void> saveDisplayMode(bool ativarGridView) async {
    final stateDisplay = await SharedPreferences.getInstance();
    await stateDisplay.setBool(_key, ativarGridView);
  }

  // Carrega a preferência
  Future<bool> loadDisplayMode() async {
    final stateDisplay = await SharedPreferences.getInstance();
    // Caso o valor para a visualização em grade seja falso,
    // Ele gera o listView como padrão.
    return stateDisplay.getBool(_key) ?? false;
  }
}