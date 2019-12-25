class Categories {
  List<Category> _categories;

  Categories({List<Category> categories}) {
    this._categories = categories;
  }

  List<Category> get categories => _categories;
  set categories(List<Category> categories) => _categories = categories;

  Categories.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      _categories = new List<Category>();
      json['categories'].forEach((v) {
        _categories.add(new Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._categories != null) {
      data['categories'] = this._categories.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  String _idCategory;
  String _strCategory;
  String _strCategoryThumb;
  String _strCategoryDescription;

  Category(
      {String idCategory,
      String strCategory,
      String strCategoryThumb,
      String strCategoryDescription}) {
    this._idCategory = idCategory;
    this._strCategory = strCategory;
    this._strCategoryThumb = strCategoryThumb;
    this._strCategoryDescription = strCategoryDescription;
  }

  String get idCategory => _idCategory;
  set idCategory(String idCategory) => _idCategory = idCategory;
  String get strCategory => _strCategory;
  set strCategory(String strCategory) => _strCategory = strCategory;
  String get strCategoryThumb => _strCategoryThumb;
  set strCategoryThumb(String strCategoryThumb) =>
      _strCategoryThumb = strCategoryThumb;
  String get strCategoryDescription => _strCategoryDescription;
  set strCategoryDescription(String strCategoryDescription) =>
      _strCategoryDescription = strCategoryDescription;

  Category.fromJson(Map<String, dynamic> json) {
    _idCategory = json['idCategory'];
    _strCategory = json['strCategory'];
    _strCategoryThumb = json['strCategoryThumb'];
    _strCategoryDescription = json['strCategoryDescription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idCategory'] = this._idCategory;
    data['strCategory'] = this._strCategory;
    data['strCategoryThumb'] = this._strCategoryThumb;
    data['strCategoryDescription'] = this._strCategoryDescription;
    return data;
  }
}
