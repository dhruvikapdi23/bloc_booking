class MyBookingModel {
  int? totalDays;
  String? airlines;
  String? airlineName;
  String? depart;
  String? arrival;
  String? departAirport;
  String? arrivalAirport;
  String? departTime;
  String? arrivalTime;
  String? status;

  MyBookingModel(
      {this.totalDays,
        this.airlines,
        this.airlineName,
        this.depart,
        this.arrival,
        this.departAirport,
        this.arrivalAirport,
        this.departTime,
        this.arrivalTime,
        this.status});

  MyBookingModel.fromJson(Map<String, dynamic> json) {
    totalDays = json['totalDays'];
    airlines = json['airlines'];
    airlineName = json['airlineName'];
    depart = json['depart'];
    arrival = json['arrival'];
    departAirport = json['departAirport'];
    arrivalAirport = json['arrivalAirport'];
    departTime = json['departTime'];
    arrivalTime = json['arrivalTime'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalDays'] = totalDays;
    data['airlines'] = airlines;
    data['airlineName'] = airlineName;
    data['depart'] = depart;
    data['arrival'] = arrival;
    data['departAirport'] = departAirport;
    data['arrivalAirport'] = arrivalAirport;
    data['departTime'] = departTime;
    data['arrivalTime'] = arrivalTime;
    data['status'] = status;
    return data;
  }
}
