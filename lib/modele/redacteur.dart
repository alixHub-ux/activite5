class Redacteur {
  int? id;
  String nom;
  String prenom;
  String email;

  // Constructeur avec id
  Redacteur({
    this.id,
    required this.nom,
    required this.prenom,
    required this.email,
  });

  // Constructeur sans id (pour l'insertion)
  Redacteur.noId({
    required this.nom,
    required this.prenom,
    required this.email,
  });

  // Convertir un objet Redacteur en Map
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'nom': nom,
      'prenom': prenom,
      'email': email,
    };
    if (id != null) map['id'] = id;
    return map;
  }

  // Convertir un Map en Redacteur
  factory Redacteur.fromMap(Map<String, dynamic> map) {
    return Redacteur(
      id: map['id'],
      nom: map['nom'],
      prenom: map['prenom'],
      email: map['email'],
    );
  }

  @override
  String toString() {
    return 'Redacteur{id: $id, nom: $nom, prenom: $prenom, email: $email}';
  }
}
