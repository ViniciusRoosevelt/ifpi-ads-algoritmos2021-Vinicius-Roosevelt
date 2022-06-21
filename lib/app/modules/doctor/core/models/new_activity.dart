class NewActivity {
  String? id;
  String? titulo;
  String? corpo;

  NewActivity({
    this.id,
    this.titulo,
    this.corpo,
  });

  NewActivity.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    titulo = json['titulo'] ?? '';
    corpo = json['corpo'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['titulo'] = this.titulo;
    data['corpo'] = this.corpo;
    return data;
  }
}
