class Items {
  final String title;
  final String summary;
  final String category;

  final String expiry;
  final String baseamount;
  final String? imagepath;
  int? maxbid;
  String? detaileddescription;

  Items({
    required this.title,
    required this.summary,
    required this.expiry,
    required this.baseamount,
    this.imagepath,
    required this.category,
    this.maxbid,
    required this.detaileddescription,
  });
  Map<String, dynamic> toJson() => {
        //agent

        "title": title,
        "summary": summary,
        "detaileddescription": detaileddescription,

        "category": category,
        "baseamount": baseamount,
        "Duration": expiry,

        "imagepath": imagepath
      };
  factory Items.fromJson(Map<String, dynamic> json) {
    return Items(
      title: json["title"],
      summary: json["summary"],
      detaileddescription: json["detaileddescription"],
      category: json["category"],
      baseamount: json["baseamount"],
      expiry: json["Duration"],
      imagepath: json["imagepath"],
    );
  }

  get widget => null;
}

class Servicemodel {
  final String title;
  final String summery;
  final String category;

  final String duration;
  final String baseamount;
  final String imagepath;

  String? description;

  Servicemodel({
    required this.title,
    required this.description,
    required this.summery,
    required this.baseamount,
    required this.imagepath,
    required this.category,
    required this.duration,
  });
  Map<String, dynamic> toJson() => {
        //agent

        "servicetitle": title,
        "servicesummery": summery,
        "servicedescription": description,

        "servicecategory": category,
        "servicebaseamount": baseamount,
        "serviceduration": duration,

        "serviceimagepath": imagepath
      };
  factory Servicemodel.fromJson(Map<String, dynamic> json) {
    return Servicemodel(
      title: json["servicetitle"],
      summery: json["servicesummery"],
      description: json["servicedescription"],
      category: json["servicecategory"],
      baseamount: json["servicebaseamount"],
      duration: json["serviceduration"],
      imagepath: json["serviceimagepath"],
    );
  }
}

class BidModel {
  String? highestbid;
  BidModel({required this.highestbid});
  Map<String, dynamic> toJson() => {
        "highestbid": highestbid,
      };
  factory BidModel.fromJson(Map<String, dynamic> json) {
    return BidModel(
      highestbid: json["highestbid"],
    );
  }
}
