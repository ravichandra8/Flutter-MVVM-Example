class CompanyResponse {
  List<Companies> _companies;

  CompanyResponse({List<Companies> companies}) {
    this._companies = companies;
  }

  List<Companies> get companies => _companies;
  set companies(List<Companies> companies) => _companies = companies;

  CompanyResponse.fromJson(Map<String, dynamic> json) {
    if (json['companies'] != null) {
      _companies = new List<Companies>();
      json['companies'].forEach((v) {
        _companies.add(new Companies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._companies != null) {
      data['companies'] = this._companies.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Companies {
  String _logoUrl;
  String _company;
  String _ceo;
  String _category;
  double _hqLatitude;
  double _hqLongitude;

  Companies(
      {String logoUrl,
        String company,
        String ceo,
        String category,
        double hqLatitude,
        double hqLongitude}) {
    this._logoUrl = logoUrl;
    this._company = company;
    this._ceo = ceo;
    this._category = category;
    this._hqLatitude = hqLatitude;
    this._hqLongitude = hqLongitude;
  }

  String get logoUrl => _logoUrl;
  set logoUrl(String logoUrl) => _logoUrl = logoUrl;
  String get company => _company;
  set company(String company) => _company = company;
  String get ceo => _ceo;
  set ceo(String ceo) => _ceo = ceo;
  String get category => _category;
  set category(String category) => _category = category;
  double get hqLatitude => _hqLatitude;
  set hqLatitude(double hqLatitude) => _hqLatitude = hqLatitude;
  double get hqLongitude => _hqLongitude;
  set hqLongitude(double hqLongitude) => _hqLongitude = hqLongitude;

  Companies.fromJson(Map<String, dynamic> json) {
    _logoUrl = json['logo_url'];
    _company = json['company'];
    _ceo = json['ceo'];
    _category = json['category'];
    _hqLatitude = json['hq_latitude'];
    _hqLongitude = json['hq_longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['logo_url'] = this._logoUrl;
    data['company'] = this._company;
    data['ceo'] = this._ceo;
    data['category'] = this._category;
    data['hq_latitude'] = this._hqLatitude;
    data['hq_longitude'] = this._hqLongitude;
    return data;
  }
}
