// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:on_lyric/model/Musica.dart';

class Repertorio {
  String? titulo;
  List<Musica>? musicas;
  Repertorio({
    this.titulo,
    this.musicas,
  });

  Repertorio copyWith({
    String? titulo,
    List<Musica>? musicas,
  }) {
    return Repertorio(
      titulo: titulo ?? this.titulo,
      musicas: musicas ?? this.musicas,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'titulo': titulo,
      'musicas': musicas?.map((x) => x.toMap()).toList(),
    };
  }

  factory Repertorio.fromMap(Map<String, dynamic> map) {
    return Repertorio(
      titulo: map['titulo'] != null ? map['titulo'] as String : null,
      musicas: map['musicas'] != null
          ? List<Musica>.from(
              (map['musicas'] as List<Musica?>).map<Musica?>(
                (x) => Musica.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Repertorio.fromJson(String source) =>
      Repertorio.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Repertorio(titulo: $titulo, musicas: $musicas)';

  @override
  bool operator ==(covariant Repertorio other) {
    if (identical(this, other)) return true;

    return other.titulo == titulo && listEquals(other.musicas, musicas);
  }

  @override
  int get hashCode => titulo.hashCode ^ musicas.hashCode;
}
