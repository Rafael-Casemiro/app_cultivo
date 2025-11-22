import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_cultivo/services/card_display_preferences.dart';

// Provider do Modo de Visualização da tela
final displayModeServiceProvider = Provider( (ref) => CardDisplayPreferences());

// Notifier do gerenciamento de estado
class DisplayModeNotifier extends StateNotifier<bool> {
  // Inicializa a exibição como ListView por padrão
  // OBS: Modificar para 'super(True)' para mudar a visualização padrão inicial
  DisplayModeNotifier(this._displayModeService) : super(false) {
    _loadInitialDisplayMode();
  }

  final CardDisplayPreferences _displayModeService;

  // Carrega o estado inicial do shared_preferences
  Future<void> _loadInitialDisplayMode() async {
    state = await _displayModeService.loadDisplayMode();
  }

  // Muda o tipo de visualização e salva
  Future<void> toggleDisplayMode() async {
    state = !state;
    await _displayModeService.saveDisplayMode(state);
  }

}

// Variável global que permite o acesso ao Notifier
final displayModeProvider = StateNotifierProvider<DisplayModeNotifier, bool>((ref)
  {
    final displayModeService = ref.watch(displayModeServiceProvider);
    return DisplayModeNotifier(displayModeService);
  }
);