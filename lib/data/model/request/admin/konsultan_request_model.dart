class KonsultanRequestModel {
  final String? nama;
  final String? spesialisasi;
  final String? foto; // Bisa berupa URL atau path dari file gambar
  final String? deskripsi;
  final String? jadwal;

  KonsultanRequestModel({
    this.nama,
    this.spesialisasi,
    this.foto,
    this.deskripsi,
    this.jadwal,
  });

  // Factory method untuk membuat instance dari Map
  factory KonsultanRequestModel.fromMap(Map<String, dynamic> json) =>
      KonsultanRequestModel(
        nama: json['nama'],
        spesialisasi: json['spesialisasi'],
        foto: json['foto'],
        deskripsi: json['deskripsi'],
        jadwal: json['jadwal'],
      );

  // Method untuk mengubah objek ke dalam format Map untuk dikirimkan ke API
  Map<String, dynamic> toMap() => {
    'nama': nama,
    'spesialisasi': spesialisasi,
    'foto': foto,
    'deskripsi': deskripsi,
    'jadwal': jadwal,
  };
}
