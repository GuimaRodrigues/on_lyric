class Musica {
  Musica({
    this.titulo,
    this.escrita,
  }) : super();

  String? titulo;
  String? escrita;

  Musica copyWith({
    String? titulo,
    String? escrita,
  }) {
    return Musica(
      titulo: titulo ?? this.titulo,
      escrita: escrita ?? this.escrita,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'titulo': titulo,
      'escrita': escrita,
    };
  }

  factory Musica.fromMap(Map<String, dynamic> map) {
    return Musica(
      titulo: map['titulo'] != null ? map['titulo'] as String : null,
      escrita: map['escrita'] != null ? map['escrita'] as String : null,
    );
  }

  factory Musica.fromJson(Map<String, dynamic> decode) {
    return Musica(
      titulo: decode['titulo'],
      escrita: decode['escrita'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> encode = <String, dynamic>{};
    // if (id != null) {
    //   encode[UsuarioConstants.columnId] = id;
    // }
    encode['titulo'] = titulo;
    encode['escrita'] = escrita;

    return encode;
  }

  // @override
  // String toString() {
  //   return 'Usuario(token: $token, empresaPadrao: $empresaPadrao, codigoUsuario: $codigoUsuario, id: $id, imagePath: $imagePath, login: $login, nome: $nome, senha: $senha, expiresIn: $expiresIn, refreshToken: $refreshToken)';
  // }

  @override
  bool operator ==(covariant Musica other) {
    if (identical(this, other)) {
      return true;
    }

    return other.titulo == titulo && other.escrita == escrita;
  }

  @override
  int get hashCode {
    return titulo.hashCode ^ escrita.hashCode;
  }
}
