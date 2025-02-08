class PaymentMethodModel {
  String? title;
  List<OptionList>? optionList;

  PaymentMethodModel({this.title, this.optionList});

  PaymentMethodModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['optionList'] != null) {
      optionList = <OptionList>[];
      json['optionList'].forEach((v) {
        optionList!.add(OptionList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    if (optionList != null) {
      data['optionList'] = optionList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OptionList {
  String? title;
  String? image;
  String? fees;

  OptionList({this.title, this.image, this.fees});

  OptionList.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    fees = json['fees'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['image'] = image;
    data['fees'] = fees;
    return data;
  }
}
