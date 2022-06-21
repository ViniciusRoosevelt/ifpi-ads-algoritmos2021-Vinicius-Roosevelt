class NewActivity {
  String? id;
  String? titulo;
  String? corpo;
  String? video;
  String? thumb;

  NewActivity({this.id, this.titulo, this.corpo, this.video, this.thumb});

  NewActivity.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    titulo = json['titulo'] ?? '';
    corpo = json['corpo'] ?? '';
    video = json['video'] ?? '';
    thumb = json['thumb'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['titulo'] = this.titulo;
    data['corpo'] = this.corpo;
    data['video'] = this.video;
    data['thumb'] = this.thumb;
    return data;
  }
}
