class Pet {
  bool isFav, isAdopt;
  final String name, imageurl;
  final int id;
  Pet(this.id, this.name, this.imageurl,
      {this.isFav = false, this.isAdopt = false});

  bool get getFav => isFav;
  set setFav(bool val) => isFav = val;

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "imageurl": imageurl,
      "isFav": isFav,
      "isAdopt": isAdopt
    };
  }

  factory Pet.fromMap(Map m) {
    return Pet(m["id"], m["name"], m["imageurl"],
        isFav: m['isFav'], isAdopt: m['isAdopt']);
  }
}
