class pfModel {
  int? id;
  String? nom;
  String? details;
  List<ProduitFinis>? produitFinis;

  pfModel({this.id, this.nom, this.details, this.produitFinis});

  pfModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nom = json['nom'];
    details = json['details'];
    if (json['produit_finis'] != null) {
      produitFinis = <ProduitFinis>[];
      json['produit_finis'].forEach((v) {
        produitFinis!.add(new ProduitFinis.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nom'] = this.nom;
    data['details'] = this.details;
    if (this.produitFinis != null) {
      data['produit_finis'] =
          this.produitFinis!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProduitFinis {
  int? id;
  String? numStock;
  String? nom;
  String? dateExpiration;
  String? quantiteActuel;
  String? prixGros;
  String? prixDetails;
  String? limite;
  String? details;
  Categorie? categorie;
  String? createdAt;
  String? updatedAt;

  ProduitFinis(
      {this.id,
      this.numStock,
      this.nom,
      this.dateExpiration,
      this.quantiteActuel,
      this.prixGros,
      this.prixDetails,
      this.limite,
      this.details,
      this.categorie,
      this.createdAt,
      this.updatedAt});

  ProduitFinis.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    numStock = json['num_stock'];
    nom = json['nom'];
    dateExpiration = json['date_expiration'];
    quantiteActuel = json['quantite_actuel'];
    prixGros = json['prix_gros'];
    prixDetails = json['prix_details'];
    limite = json['limite'];
    details = json['details'];
    categorie = json['categorie'] != null
        ? new Categorie.fromJson(json['categorie'])
        : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['num_stock'] = this.numStock;
    data['nom'] = this.nom;
    data['date_expiration'] = this.dateExpiration;
    data['quantite_actuel'] = this.quantiteActuel;
    data['prix_gros'] = this.prixGros;
    data['prix_details'] = this.prixDetails;
    data['limite'] = this.limite;
    data['details'] = this.details;
    if (this.categorie != null) {
      data['categorie'] = this.categorie!.toJson();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Categorie {
  int? id;
  String? nom;

  Categorie({this.id, this.nom});

  Categorie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nom = json['nom'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nom'] = this.nom;
    return data;
  }
}