class UserData {
  String nama;
  int umur;
  String email;

  UserData(this.nama, this.umur, this.email);

  // Metode untuk menghapus indeks di depan nama (mengembalikan nama tanpa indeks)
  String getNamaWithoutIndex() {
    return nama.substring(nama.indexOf('.') + 2);
  }
}
