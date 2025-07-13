import 'dart:convert';

class AddKonsultanResponseModel {
  final String message;
  final int? statusCode;
  final Konsultan? konsultan;

  AddKonsultanResponseModel({
    required this.message,
    this.statusCode,
    this.konsultan,
  });

  factory AddKonsultanResponseModel.fromRawJson(String str) =>
      AddKonsultanResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddKonsultanResponseModel.fromJson(Map<String, dynamic> json) {
    return AddKonsultanResponseModel(
      message: json['message'] ?? 'Konsultan berhasil ditambahkan',
      statusCode: json['status_code'],
      konsultan: json['data'] != null ? Konsultan.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'message': message,
    'status_code': statusCode,
    'data': konsultan?.toJson(),
  };
}

class DeleteKonsultanResponseModel {
  final String message;
  final int? statusCode;

  DeleteKonsultanResponseModel({required this.message, this.statusCode});

  factory DeleteKonsultanResponseModel.fromRawJson(String str) =>
      DeleteKonsultanResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DeleteKonsultanResponseModel.fromJson(Map<String, dynamic> json) {
    return DeleteKonsultanResponseModel(
      message: json['message'] ?? 'Konsultan berhasil dihapus',
      statusCode: json['status_code'],
    );
  }

  Map<String, dynamic> toJson() => {
    'message': message,
    'status_code': statusCode,
  };
}

class UpdateKonsultanResponseModel {
  final String message;
  final int? statusCode;
  final Konsultan? konsultan;

  UpdateKonsultanResponseModel({
    required this.message,
    this.statusCode,
    this.konsultan,
  });

  factory UpdateKonsultanResponseModel.fromRawJson(String str) =>
      UpdateKonsultanResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UpdateKonsultanResponseModel.fromJson(Map<String, dynamic> json) {
    return UpdateKonsultanResponseModel(
      message: json['message'] ?? 'Konsultan berhasil diperbarui',
      statusCode: json['status_code'],
      konsultan: json['data'] != null ? Konsultan.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'message': message,
    'status_code': statusCode,
    'data': konsultan?.toJson(),
  };
}

class Konsultan {
  final String? nama;
  final String? spesialisasi;
  final String? foto;
  final String? deskripsi;
  final String? jadwal;

  Konsultan({
    this.nama,
    this.spesialisasi,
    this.foto,
    this.deskripsi,
    this.jadwal,
  });

  factory Konsultan.fromJson(Map<String, dynamic> json) => Konsultan(
    nama: json['nama'],
    spesialisasi: json['spesialisasi'],
    foto: json['foto'],
    deskripsi: json['deskripsi'],
    jadwal: json['jadwal'],
  );

  Map<String, dynamic> toJson() => {
    'nama': nama,
    'spesialisasi': spesialisasi,
    'foto': foto,
    'deskripsi': deskripsi,
    'jadwal': jadwal,
  };
}
