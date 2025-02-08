class CountryBenefitModel {
  String? title;
  List<String>? faqList;
  String? desc;
  List<ContactList>? contactList;

  CountryBenefitModel({this.title, this.faqList, this.desc, this.contactList});

  CountryBenefitModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    faqList = json['faqList'].cast<String>();
    desc = json['desc'];
    if (json['contactList'] != null) {
      contactList = <ContactList>[];
      json['contactList'].forEach((v) {
        contactList!.add(ContactList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['faqList'] = faqList;
    data['desc'] = desc;
    if (contactList != null) {
      data['contactList'] = contactList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ContactList {
  String? country;
  String? phone;

  ContactList({this.country, this.phone});

  ContactList.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['country'] = country;
    data['phone'] = phone;
    return data;
  }
}
