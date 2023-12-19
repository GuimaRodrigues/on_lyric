import 'package:flutter_session_manager/flutter_session_manager.dart';

class ControlSession {
  ControlSession.internal();

  factory ControlSession() => _instance;
  static final ControlSession _instance = ControlSession.internal();

  /// - Armazenar valores na sessão
  Future<void> set(String key, dynamic value) async {
    await SessionManager().set(key, value);
  }

  /// - Ler valores da sessão
  Future<dynamic> get(String key) async {
    return SessionManager().get(key);
  }

  /// - Atualizar sessão
  Future<void> update() async {
    await SessionManager().update();
  }

  /// - Excluir sessão e todos os dados nela
  Future<void> destroy() async {
    await SessionManager().destroy();
  }

  /// - Remover um item específico
  Future<void> remove(String key) async {
    await SessionManager().remove(key);
  }

  /// - Verifique se existe ou não uma chave
  Future<bool> contain(String key) async {
    return SessionManager().containsKey(key);
  }
}
