class CountryModel{

  final String name;
  final String imgPath;
  final String numberCode;

  CountryModel({
    required this.name,
    required this.imgPath,
    required this.numberCode
});

  factory CountryModel.fromJson(Map<String, dynamic> json){
    return CountryModel(name: json['name'], imgPath: json['imgPath'], numberCode: json['numberCode']);
  }
}