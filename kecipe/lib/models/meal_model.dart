import 'dart:convert';

class RecipeModel {
  String q;
  int from;
  int to;
  Params params;
  bool more;
  int count;
  List<Hits> hits;

  RecipeModel(
      {this.q,
      this.from,
      this.to,
      this.params,
      this.more,
      this.count,
      this.hits});

  RecipeModel.fromJson(Map<String, dynamic> json) {
    q = json['q'];
    from = json['from'].toInt();
    to = json['to'].toInt();
    params =
        json['params'] != null ? new Params.fromJson(json['params']) : null;
    more = json['more'];
    count = json['count'].toInt();
    if (json['hits'] != null) {
      hits = new List<Hits>();
      json['hits'].forEach((v) {
        hits.add(new Hits.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['q'] = this.q;
    data['from'] = this.from;
    data['to'] = this.to;
    if (this.params != null) {
      data['params'] = this.params.toJson();
    }
    data['more'] = this.more;
    data['count'] = this.count;
    if (this.hits != null) {
      data['hits'] = this.hits.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Params {
  List<Null> sane;
  List<String> q;
  List<String> appKey;
  List<String> from;
  List<String> to;
  List<String> calories;
  List<String> appId;

  Params(
      {this.sane,
      this.q,
      this.appKey,
      this.from,
      this.to,
      this.calories,
      this.appId});

  Params.fromJson(Map<String, dynamic> json) {
    // if (json['sane'] != null) {
    //   sane = new List<Null>();
    //   json['sane'].forEach((v) {
    //     sane.add(new Null.fromJson(v));
    //   });
    // }
    q = json['q'].cast<String>();
    appKey = json['app_key'].cast<String>();
    from = json['from'].cast<String>();
    to = json['to'].cast<String>();
    calories = json['calories'].cast<String>();
    appId = json['app_id'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // if (this.sane != null) {
    //   data['sane'] = this.sane.map((v) => v.toJson()).toList();
    // }
    data['q'] = this.q;
    data['app_key'] = this.appKey;
    data['from'] = this.from;
    data['to'] = this.to;
    data['calories'] = this.calories;
    data['app_id'] = this.appId;
    return data;
  }
}

class Hits {
  Recipe recipe;
  bool bookmarked;
  bool bought;

  Hits({this.recipe, this.bookmarked, this.bought});

  Hits.fromJson(Map<String, dynamic> json) {
    recipe =
        json['recipe'] != null ? new Recipe.fromJson(json['recipe']) : null;
    bookmarked = json['bookmarked'];
    bought = json['bought'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.recipe != null) {
      data['recipe'] = this.recipe.toJson();
    }
    data['bookmarked'] = this.bookmarked;
    data['bought'] = this.bought;
    return data;
  }
}

class Recipe {
  String uri;
  String label;
  String image;
  String source;
  String url;
  String shareAs;
  int yield;
  List<String> dietLabels;
  List<String> healthLabels;
  List<String> cautions;
  List<String> ingredientLines;
  List<Ingredients> ingredients;
  double calories;
  double totalWeight;
  int totalTime;
  TotalNutrients totalNutrients;
  TotalDaily totalDaily;
  List<Digest> digest;

  Recipe(
      {this.uri,
      this.label,
      this.image,
      this.source,
      this.url,
      this.shareAs,
      this.yield,
      this.dietLabels,
      this.healthLabels,
      this.cautions,
      this.ingredientLines,
      this.ingredients,
      this.calories,
      this.totalWeight,
      this.totalTime,
      this.totalNutrients,
      this.totalDaily,
      this.digest});

  Recipe.fromJson(Map<String, dynamic> json) {
    uri = json['uri'];
    label = json['label'];
    image = json['image'];
    source = json['source'];
    url = json['url'];
    shareAs = json['shareAs'];
    yield = json['yield'].toInt();
    dietLabels = json['dietLabels'].cast<String>();
    healthLabels = json['healthLabels'].cast<String>();
    cautions = json['cautions'].cast<String>();
    // if (json['cautions'] != null) {
    //   cautions = new List<Null>();
    //   json['cautions'].forEach((v) {
    //     cautions.add(new Null.fromJson(v));
    //   });
    // }
    ingredientLines = json['ingredientLines'].cast<String>();
    if (json['ingredients'] != null) {
      ingredients = new List<Ingredients>();
      json['ingredients'].forEach((v) {
        ingredients.add(new Ingredients.fromJson(v));
      });
    }
    calories = json['calories'].toDouble();
    totalWeight = json['totalWeight'].toDouble();
    totalTime = json['totalTime'].toInt();
    totalNutrients = json['totalNutrients'] != null
        ? new TotalNutrients.fromJson(json['totalNutrients'])
        : null;
    totalDaily = json['totalDaily'] != null
        ? new TotalDaily.fromJson(json['totalDaily'])
        : null;
    if (json['digest'] != null) {
      digest = new List<Digest>();
      json['digest'].forEach((v) {
        digest.add(new Digest.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uri'] = this.uri;
    data['label'] = this.label;
    data['image'] = this.image;
    data['source'] = this.source;
    data['url'] = this.url;
    data['shareAs'] = this.shareAs;
    data['yield'] = this.yield;
    data['dietLabels'] = this.dietLabels;
    data['healthLabels'] = this.healthLabels;
    data['cautions'] = this.cautions;
    // if (this.cautions != null) {
    //   data['cautions'] = this.cautions.map((v) => v.toJson()).toList();
    // }
    data['ingredientLines'] = this.ingredientLines;
    if (this.ingredients != null) {
      data['ingredients'] = this.ingredients.map((v) => v.toJson()).toList();
    }
    data['calories'] = this.calories;
    data['totalWeight'] = this.totalWeight;
    data['totalTime'] = this.totalTime;
    if (this.totalNutrients != null) {
      data['totalNutrients'] = this.totalNutrients.toJson();
    }
    if (this.totalDaily != null) {
      data['totalDaily'] = this.totalDaily.toJson();
    }
    if (this.digest != null) {
      data['digest'] = this.digest.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Ingredients {
  String text;
  double weight;

  Ingredients({this.text, this.weight});

  Ingredients.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['weight'] = this.weight.toDouble();
    return data;
  }
}

class TotalNutrients {
  ENERCKCAL eNERCKCAL;
  FAT fAT;
  FASAT fASAT;
  FATRN fATRN;
  FAMS fAMS;
  FAPU fAPU;
  CHOCDF cHOCDF;
  FIBTG fIBTG;
  SUGAR sUGAR;
  PROCNT pROCNT;
  CHOLE cHOLE;
  NA nA;
  CA cA;
  MG mG;
  K k;
  FE fE;
  ZN zN;
  P p;
  VITARAE vITARAE;
  VITC vITC;
  THIA tHIA;
  RIBF rIBF;
  NIA nIA;
  VITB6A vITB6A;
  FOLDFE fOLDFE;
  FOLFD fOLFD;
  VITB12 vITB12;
  VITD vITD;
  TOCPHA tOCPHA;
  VITK1 vITK1;

  TotalNutrients(
      {this.eNERCKCAL,
      this.fAT,
      this.fASAT,
      this.fATRN,
      this.fAMS,
      this.fAPU,
      this.cHOCDF,
      this.fIBTG,
      this.sUGAR,
      this.pROCNT,
      this.cHOLE,
      this.nA,
      this.cA,
      this.mG,
      this.k,
      this.fE,
      this.zN,
      this.p,
      this.vITARAE,
      this.vITC,
      this.tHIA,
      this.rIBF,
      this.nIA,
      this.vITB6A,
      this.fOLDFE,
      this.fOLFD,
      this.vITB12,
      this.vITD,
      this.tOCPHA,
      this.vITK1});

  TotalNutrients.fromJson(Map<String, dynamic> json) {
    eNERCKCAL = json['ENERC_KCAL'] != null
        ? new ENERCKCAL.fromJson(json['ENERC_KCAL'])
        : null;
    fAT = json['FAT'] != null ? new FAT.fromJson(json['FAT']) : null;
    fASAT = json['FASAT'] != null ? new FASAT.fromJson(json['FASAT']) : null;
    fATRN = json['FATRN'] != null ? new FATRN.fromJson(json['FATRN']) : null;
    fAMS = json['FAMS'] != null ? new FAMS.fromJson(json['FAMS']) : null;
    fAPU = json['FAPU'] != null ? new FAPU.fromJson(json['FAPU']) : null;
    cHOCDF =
        json['CHOCDF'] != null ? new CHOCDF.fromJson(json['CHOCDF']) : null;
    fIBTG = json['FIBTG'] != null ? new FIBTG.fromJson(json['FIBTG']) : null;
    sUGAR = json['SUGAR'] != null ? new SUGAR.fromJson(json['SUGAR']) : null;
    pROCNT =
        json['PROCNT'] != null ? new PROCNT.fromJson(json['PROCNT']) : null;
    cHOLE = json['CHOLE'] != null ? new CHOLE.fromJson(json['CHOLE']) : null;
    nA = json['NA'] != null ? new NA.fromJson(json['NA']) : null;
    cA = json['CA'] != null ? new CA.fromJson(json['CA']) : null;
    mG = json['MG'] != null ? new MG.fromJson(json['MG']) : null;
    k = json['K'] != null ? new K.fromJson(json['K']) : null;
    fE = json['FE'] != null ? new FE.fromJson(json['FE']) : null;
    zN = json['ZN'] != null ? new ZN.fromJson(json['ZN']) : null;
    p = json['P'] != null ? new P.fromJson(json['P']) : null;
    vITARAE = json['VITA_RAE'] != null
        ? new VITARAE.fromJson(json['VITA_RAE'])
        : null;
    vITC = json['VITC'] != null ? new VITC.fromJson(json['VITC']) : null;
    tHIA = json['THIA'] != null ? new THIA.fromJson(json['THIA']) : null;
    rIBF = json['RIBF'] != null ? new RIBF.fromJson(json['RIBF']) : null;
    nIA = json['NIA'] != null ? new NIA.fromJson(json['NIA']) : null;
    vITB6A =
        json['VITB6A'] != null ? new VITB6A.fromJson(json['VITB6A']) : null;
    fOLDFE =
        json['FOLDFE'] != null ? new FOLDFE.fromJson(json['FOLDFE']) : null;
    fOLFD = json['FOLFD'] != null ? new FOLFD.fromJson(json['FOLFD']) : null;
    vITB12 =
        json['VITB12'] != null ? new VITB12.fromJson(json['VITB12']) : null;
    vITD = json['VITD'] != null ? new VITD.fromJson(json['VITD']) : null;
    tOCPHA =
        json['TOCPHA'] != null ? new TOCPHA.fromJson(json['TOCPHA']) : null;
    vITK1 = json['VITK1'] != null ? new VITK1.fromJson(json['VITK1']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.eNERCKCAL != null) {
      data['ENERC_KCAL'] = this.eNERCKCAL.toJson();
    }
    if (this.fAT != null) {
      data['FAT'] = this.fAT.toJson();
    }
    if (this.fASAT != null) {
      data['FASAT'] = this.fASAT.toJson();
    }
    if (this.fATRN != null) {
      data['FATRN'] = this.fATRN.toJson();
    }
    if (this.fAMS != null) {
      data['FAMS'] = this.fAMS.toJson();
    }
    if (this.fAPU != null) {
      data['FAPU'] = this.fAPU.toJson();
    }
    if (this.cHOCDF != null) {
      data['CHOCDF'] = this.cHOCDF.toJson();
    }
    if (this.fIBTG != null) {
      data['FIBTG'] = this.fIBTG.toJson();
    }
    if (this.sUGAR != null) {
      data['SUGAR'] = this.sUGAR.toJson();
    }
    if (this.pROCNT != null) {
      data['PROCNT'] = this.pROCNT.toJson();
    }
    if (this.cHOLE != null) {
      data['CHOLE'] = this.cHOLE.toJson();
    }
    if (this.nA != null) {
      data['NA'] = this.nA.toJson();
    }
    if (this.cA != null) {
      data['CA'] = this.cA.toJson();
    }
    if (this.mG != null) {
      data['MG'] = this.mG.toJson();
    }
    if (this.k != null) {
      data['K'] = this.k.toJson();
    }
    if (this.fE != null) {
      data['FE'] = this.fE.toJson();
    }
    if (this.zN != null) {
      data['ZN'] = this.zN.toJson();
    }
    if (this.p != null) {
      data['P'] = this.p.toJson();
    }
    if (this.vITARAE != null) {
      data['VITA_RAE'] = this.vITARAE.toJson();
    }
    if (this.vITC != null) {
      data['VITC'] = this.vITC.toJson();
    }
    if (this.tHIA != null) {
      data['THIA'] = this.tHIA.toJson();
    }
    if (this.rIBF != null) {
      data['RIBF'] = this.rIBF.toJson();
    }
    if (this.nIA != null) {
      data['NIA'] = this.nIA.toJson();
    }
    if (this.vITB6A != null) {
      data['VITB6A'] = this.vITB6A.toJson();
    }
    if (this.fOLDFE != null) {
      data['FOLDFE'] = this.fOLDFE.toJson();
    }
    if (this.fOLFD != null) {
      data['FOLFD'] = this.fOLFD.toJson();
    }
    if (this.vITB12 != null) {
      data['VITB12'] = this.vITB12.toJson();
    }
    if (this.vITD != null) {
      data['VITD'] = this.vITD.toJson();
    }
    if (this.tOCPHA != null) {
      data['TOCPHA'] = this.tOCPHA.toJson();
    }
    if (this.vITK1 != null) {
      data['VITK1'] = this.vITK1.toJson();
    }
    return data;
  }
}

class ENERCKCAL {
  String label;
  double quantity;
  String unit;

  ENERCKCAL({this.label, this.quantity, this.unit});

  ENERCKCAL.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    quantity = json['quantity'].toDouble();
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['quantity'] = this.quantity;
    data['unit'] = this.unit;
    return data;
  }
}

class FAT {
  String label;
  double quantity;
  String unit;

  FAT({this.label, this.quantity, this.unit});

  FAT.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    quantity = json['quantity'].toDouble();
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['quantity'] = this.quantity;
    data['unit'] = this.unit;
    return data;
  }
}

class FASAT {
  String label;
  double quantity;
  String unit;

  FASAT({this.label, this.quantity, this.unit});

  FASAT.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    quantity = json['quantity'].toDouble();
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['quantity'] = this.quantity;
    data['unit'] = this.unit;
    return data;
  }
}

class FATRN {
  String label;
  double quantity;
  String unit;

  FATRN({this.label, this.quantity, this.unit});

  FATRN.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    quantity = json['quantity'].toDouble();
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['quantity'] = this.quantity;
    data['unit'] = this.unit;
    return data;
  }
}

class FAMS {
  String label;
  double quantity;
  String unit;

  FAMS({this.label, this.quantity, this.unit});

  FAMS.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    quantity = json['quantity'].toDouble();
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['quantity'] = this.quantity;
    data['unit'] = this.unit;
    return data;
  }
}

class FAPU {
  String label;
  double quantity;
  String unit;

  FAPU({this.label, this.quantity, this.unit});

  FAPU.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    quantity = json['quantity'].toDouble();
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['quantity'] = this.quantity;
    data['unit'] = this.unit;
    return data;
  }
}

class CHOCDF {
  String label;
  double quantity;
  String unit;

  CHOCDF({this.label, this.quantity, this.unit});

  CHOCDF.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    quantity = json['quantity'].toDouble();
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['quantity'] = this.quantity;
    data['unit'] = this.unit;
    return data;
  }
}

class FIBTG {
  String label;
  double quantity;
  String unit;

  FIBTG({this.label, this.quantity, this.unit});

  FIBTG.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    quantity = json['quantity'].toDouble();
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['quantity'] = this.quantity;
    data['unit'] = this.unit;
    return data;
  }
}

class SUGAR {
  String label;
  double quantity;
  String unit;

  SUGAR({this.label, this.quantity, this.unit});

  SUGAR.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    quantity = json['quantity'].toDouble();
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['quantity'] = this.quantity;
    data['unit'] = this.unit;
    return data;
  }
}

class PROCNT {
  String label;
  double quantity;
  String unit;

  PROCNT({this.label, this.quantity, this.unit});

  PROCNT.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    quantity = json['quantity'].toDouble();
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['quantity'] = this.quantity;
    data['unit'] = this.unit;
    return data;
  }
}

class CHOLE {
  String label;
  double quantity;
  String unit;

  CHOLE({this.label, this.quantity, this.unit});

  CHOLE.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    quantity = json['quantity'].toDouble();
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['quantity'] = this.quantity;
    data['unit'] = this.unit;
    return data;
  }
}

class NA {
  String label;
  double quantity;
  String unit;

  NA({this.label, this.quantity, this.unit});

  NA.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    quantity = json['quantity'].toDouble();
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['quantity'] = this.quantity;
    data['unit'] = this.unit;
    return data;
  }
}

class CA {
  String label;
  double quantity;
  String unit;

  CA({this.label, this.quantity, this.unit});

  CA.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    quantity = json['quantity'].toDouble();
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['quantity'] = this.quantity;
    data['unit'] = this.unit;
    return data;
  }
}

class MG {
  String label;
  double quantity;
  String unit;

  MG({this.label, this.quantity, this.unit});

  MG.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    quantity = json['quantity'].toDouble();
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['quantity'] = this.quantity;
    data['unit'] = this.unit;
    return data;
  }
}

class K {
  String label;
  double quantity;
  String unit;

  K({this.label, this.quantity, this.unit});

  K.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    quantity = json['quantity'].toDouble();
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['quantity'] = this.quantity;
    data['unit'] = this.unit;
    return data;
  }
}

class FE {
  String label;
  double quantity;
  String unit;

  FE({this.label, this.quantity, this.unit});

  FE.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    quantity = json['quantity'].toDouble();
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['quantity'] = this.quantity;
    data['unit'] = this.unit;
    return data;
  }
}

class ZN {
  String label;
  double quantity;
  String unit;

  ZN({this.label, this.quantity, this.unit});

  ZN.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    quantity = json['quantity'].toDouble();
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['quantity'] = this.quantity;
    data['unit'] = this.unit;
    return data;
  }
}

class P {
  String label;
  double quantity;
  String unit;

  P({this.label, this.quantity, this.unit});

  P.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    quantity = json['quantity'].toDouble();
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['quantity'] = this.quantity;
    data['unit'] = this.unit;
    return data;
  }
}

class VITARAE {
  String label;
  double quantity;
  String unit;

  VITARAE({this.label, this.quantity, this.unit});

  VITARAE.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    quantity = json['quantity'].toDouble();
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['quantity'] = this.quantity;
    data['unit'] = this.unit;
    return data;
  }
}

class VITC {
  String label;
  double quantity;
  String unit;

  VITC({this.label, this.quantity, this.unit});

  VITC.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    quantity = json['quantity'].toDouble();
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['quantity'] = this.quantity;
    data['unit'] = this.unit;
    return data;
  }
}

class THIA {
  String label;
  double quantity;
  String unit;

  THIA({this.label, this.quantity, this.unit});

  THIA.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    quantity = json['quantity'].toDouble();
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['quantity'] = this.quantity;
    data['unit'] = this.unit;
    return data;
  }
}

class RIBF {
  String label;
  double quantity;
  String unit;

  RIBF({this.label, this.quantity, this.unit});

  RIBF.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    quantity = json['quantity'].toDouble();
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['quantity'] = this.quantity;
    data['unit'] = this.unit;
    return data;
  }
}

class NIA {
  String label;
  double quantity;
  String unit;

  NIA({this.label, this.quantity, this.unit});

  NIA.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    quantity = json['quantity'].toDouble();
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['quantity'] = this.quantity;
    data['unit'] = this.unit;
    return data;
  }
}

class VITB6A {
  String label;
  double quantity;
  String unit;

  VITB6A({this.label, this.quantity, this.unit});

  VITB6A.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    quantity = json['quantity'].toDouble();
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['quantity'] = this.quantity;
    data['unit'] = this.unit;
    return data;
  }
}

class FOLDFE {
  String label;
  double quantity;
  String unit;

  FOLDFE({this.label, this.quantity, this.unit});

  FOLDFE.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    quantity = json['quantity'].toDouble();
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['quantity'] = this.quantity;
    data['unit'] = this.unit;
    return data;
  }
}

class FOLFD {
  String label;
  double quantity;
  String unit;

  FOLFD({this.label, this.quantity, this.unit});

  FOLFD.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    quantity = json['quantity'].toDouble();
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['quantity'] = this.quantity;
    data['unit'] = this.unit;
    return data;
  }
}

class VITB12 {
  String label;
  double quantity;
  String unit;

  VITB12({this.label, this.quantity, this.unit});

  VITB12.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    quantity = json['quantity'].toDouble();
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['quantity'] = this.quantity;
    data['unit'] = this.unit;
    return data;
  }
}

class VITD {
  String label;
  double quantity;
  String unit;

  VITD({this.label, this.quantity, this.unit});

  VITD.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    quantity = json['quantity'].toDouble();
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['quantity'] = this.quantity;
    data['unit'] = this.unit;
    return data;
  }
}

class TOCPHA {
  String label;
  double quantity;
  String unit;

  TOCPHA({this.label, this.quantity, this.unit});

  TOCPHA.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    quantity = json['quantity'].toDouble();
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['quantity'] = this.quantity;
    data['unit'] = this.unit;
    return data;
  }
}

class VITK1 {
  String label;
  double quantity;
  String unit;

  VITK1({this.label, this.quantity, this.unit});

  VITK1.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    quantity = json['quantity'].toDouble();
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['quantity'] = this.quantity;
    data['unit'] = this.unit;
    return data;
  }
}

class TotalDaily {
  ENERCKCAL eNERCKCAL;
  FAT fAT;
  FASAT fASAT;
  CHOCDF cHOCDF;
  FIBTG fIBTG;
  PROCNT pROCNT;
  CHOLE cHOLE;
  NA nA;
  CA cA;
  MG mG;
  K k;
  FE fE;
  ZN zN;
  P p;
  VITARAE vITARAE;
  VITC vITC;
  THIA tHIA;
  RIBF rIBF;
  NIA nIA;
  VITB6A vITB6A;
  FOLDFE fOLDFE;
  VITB12 vITB12;
  VITD vITD;
  TOCPHA tOCPHA;
  VITK1 vITK1;

  TotalDaily(
      {this.eNERCKCAL,
      this.fAT,
      this.fASAT,
      this.cHOCDF,
      this.fIBTG,
      this.pROCNT,
      this.cHOLE,
      this.nA,
      this.cA,
      this.mG,
      this.k,
      this.fE,
      this.zN,
      this.p,
      this.vITARAE,
      this.vITC,
      this.tHIA,
      this.rIBF,
      this.nIA,
      this.vITB6A,
      this.fOLDFE,
      this.vITB12,
      this.vITD,
      this.tOCPHA,
      this.vITK1});

  TotalDaily.fromJson(Map<String, dynamic> json) {
    eNERCKCAL = json['ENERC_KCAL'] != null
        ? new ENERCKCAL.fromJson(json['ENERC_KCAL'])
        : null;
    fAT = json['FAT'] != null ? new FAT.fromJson(json['FAT']) : null;
    fASAT = json['FASAT'] != null ? new FASAT.fromJson(json['FASAT']) : null;
    cHOCDF =
        json['CHOCDF'] != null ? new CHOCDF.fromJson(json['CHOCDF']) : null;
    fIBTG = json['FIBTG'] != null ? new FIBTG.fromJson(json['FIBTG']) : null;
    pROCNT =
        json['PROCNT'] != null ? new PROCNT.fromJson(json['PROCNT']) : null;
    cHOLE = json['CHOLE'] != null ? new CHOLE.fromJson(json['CHOLE']) : null;
    nA = json['NA'] != null ? new NA.fromJson(json['NA']) : null;
    cA = json['CA'] != null ? new CA.fromJson(json['CA']) : null;
    mG = json['MG'] != null ? new MG.fromJson(json['MG']) : null;
    k = json['K'] != null ? new K.fromJson(json['K']) : null;
    fE = json['FE'] != null ? new FE.fromJson(json['FE']) : null;
    zN = json['ZN'] != null ? new ZN.fromJson(json['ZN']) : null;
    p = json['P'] != null ? new P.fromJson(json['P']) : null;
    vITARAE = json['VITA_RAE'] != null
        ? new VITARAE.fromJson(json['VITA_RAE'])
        : null;
    vITC = json['VITC'] != null ? new VITC.fromJson(json['VITC']) : null;
    tHIA = json['THIA'] != null ? new THIA.fromJson(json['THIA']) : null;
    rIBF = json['RIBF'] != null ? new RIBF.fromJson(json['RIBF']) : null;
    nIA = json['NIA'] != null ? new NIA.fromJson(json['NIA']) : null;
    vITB6A =
        json['VITB6A'] != null ? new VITB6A.fromJson(json['VITB6A']) : null;
    fOLDFE =
        json['FOLDFE'] != null ? new FOLDFE.fromJson(json['FOLDFE']) : null;
    vITB12 =
        json['VITB12'] != null ? new VITB12.fromJson(json['VITB12']) : null;
    vITD = json['VITD'] != null ? new VITD.fromJson(json['VITD']) : null;
    tOCPHA =
        json['TOCPHA'] != null ? new TOCPHA.fromJson(json['TOCPHA']) : null;
    vITK1 = json['VITK1'] != null ? new VITK1.fromJson(json['VITK1']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.eNERCKCAL != null) {
      data['ENERC_KCAL'] = this.eNERCKCAL.toJson();
    }
    if (this.fAT != null) {
      data['FAT'] = this.fAT.toJson();
    }
    if (this.fASAT != null) {
      data['FASAT'] = this.fASAT.toJson();
    }
    if (this.cHOCDF != null) {
      data['CHOCDF'] = this.cHOCDF.toJson();
    }
    if (this.fIBTG != null) {
      data['FIBTG'] = this.fIBTG.toJson();
    }
    if (this.pROCNT != null) {
      data['PROCNT'] = this.pROCNT.toJson();
    }
    if (this.cHOLE != null) {
      data['CHOLE'] = this.cHOLE.toJson();
    }
    if (this.nA != null) {
      data['NA'] = this.nA.toJson();
    }
    if (this.cA != null) {
      data['CA'] = this.cA.toJson();
    }
    if (this.mG != null) {
      data['MG'] = this.mG.toJson();
    }
    if (this.k != null) {
      data['K'] = this.k.toJson();
    }
    if (this.fE != null) {
      data['FE'] = this.fE.toJson();
    }
    if (this.zN != null) {
      data['ZN'] = this.zN.toJson();
    }
    if (this.p != null) {
      data['P'] = this.p.toJson();
    }
    if (this.vITARAE != null) {
      data['VITA_RAE'] = this.vITARAE.toJson();
    }
    if (this.vITC != null) {
      data['VITC'] = this.vITC.toJson();
    }
    if (this.tHIA != null) {
      data['THIA'] = this.tHIA.toJson();
    }
    if (this.rIBF != null) {
      data['RIBF'] = this.rIBF.toJson();
    }
    if (this.nIA != null) {
      data['NIA'] = this.nIA.toJson();
    }
    if (this.vITB6A != null) {
      data['VITB6A'] = this.vITB6A.toJson();
    }
    if (this.fOLDFE != null) {
      data['FOLDFE'] = this.fOLDFE.toJson();
    }
    if (this.vITB12 != null) {
      data['VITB12'] = this.vITB12.toJson();
    }
    if (this.vITD != null) {
      data['VITD'] = this.vITD.toJson();
    }
    if (this.tOCPHA != null) {
      data['TOCPHA'] = this.tOCPHA.toJson();
    }
    if (this.vITK1 != null) {
      data['VITK1'] = this.vITK1.toJson();
    }
    return data;
  }
}

class Digest {
  String label;
  String tag;
  String schemaOrgTag;
  double total;
  bool hasRDI;
  double daily;
  String unit;
  List<Sub> sub;

  Digest(
      {this.label,
      this.tag,
      this.schemaOrgTag,
      this.total,
      this.hasRDI,
      this.daily,
      this.unit,
      this.sub});

  Digest.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    tag = json['tag'];
    schemaOrgTag = json['schemaOrgTag'];
    total = json['total'].toDouble();
    hasRDI = json['hasRDI'];
    daily = json['daily'].toDouble();
    unit = json['unit'];
    if (json['sub'] != null) {
      sub = new List<Sub>();
      json['sub'].forEach((v) {
        sub.add(new Sub.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['tag'] = this.tag;
    data['schemaOrgTag'] = this.schemaOrgTag;
    data['total'] = this.total;
    data['hasRDI'] = this.hasRDI;
    data['daily'] = this.daily;
    data['unit'] = this.unit;
    if (this.sub != null) {
      data['sub'] = this.sub.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sub {
  String label;
  String tag;
  String schemaOrgTag;
  double total;
  bool hasRDI;
  double daily;
  String unit;

  Sub(
      {this.label,
      this.tag,
      this.schemaOrgTag,
      this.total,
      this.hasRDI,
      this.daily,
      this.unit});

  Sub.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    tag = json['tag'];
    schemaOrgTag = json['schemaOrgTag'];
    total = json['total'].toDouble();
    hasRDI = json['hasRDI'];
    daily = json['daily'].toDouble();
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['tag'] = this.tag;
    data['schemaOrgTag'] = this.schemaOrgTag;
    data['total'] = this.total;
    data['hasRDI'] = this.hasRDI;
    data['daily'] = this.daily;
    data['unit'] = this.unit;
    return data;
  }
}
