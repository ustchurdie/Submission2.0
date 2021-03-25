class WeatherModel {
  Rainfall rainfall;
  List<int> icon;
  String iconUpdateTime;
  String uvindex;
  String updateTime;
  Temperature temperature;
  String warningMessage;
  String mintempFrom00To09;
  String rainfallFrom00To12;
  String rainfallLastMonth;
  String rainfallJanuaryToLastMonth;
  String tcmessage;
  Temperature humidity;

  WeatherModel(
      {this.rainfall,
      this.icon,
      this.iconUpdateTime,
      this.uvindex,
      this.updateTime,
      this.temperature,
      this.warningMessage,
      this.mintempFrom00To09,
      this.rainfallFrom00To12,
      this.rainfallLastMonth,
      this.rainfallJanuaryToLastMonth,
      this.tcmessage,
      this.humidity});

  WeatherModel.fromJson(Map<String, dynamic> json) {
    rainfall = json['rainfall'] != null
        ? new Rainfall.fromJson(json['rainfall'])
        : null;
    icon = json['icon'].cast<int>();
    iconUpdateTime = json['iconUpdateTime'];
    uvindex = json['uvindex'];
    updateTime = json['updateTime'];
    temperature = json['temperature'] != null
        ? new Temperature.fromJson(json['temperature'])
        : null;
    warningMessage = json['warningMessage'];
    mintempFrom00To09 = json['mintempFrom00To09'];
    rainfallFrom00To12 = json['rainfallFrom00To12'];
    rainfallLastMonth = json['rainfallLastMonth'];
    rainfallJanuaryToLastMonth = json['rainfallJanuaryToLastMonth'];
    tcmessage = json['tcmessage'];
    humidity = json['humidity'] != null
        ? new Temperature.fromJson(json['humidity'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rainfall != null) {
      data['rainfall'] = this.rainfall.toJson();
    }
    data['icon'] = this.icon;
    data['iconUpdateTime'] = this.iconUpdateTime;
    data['uvindex'] = this.uvindex;
    data['updateTime'] = this.updateTime;
    if (this.temperature != null) {
      data['temperature'] = this.temperature.toJson();
    }
    data['warningMessage'] = this.warningMessage;
    data['mintempFrom00To09'] = this.mintempFrom00To09;
    data['rainfallFrom00To12'] = this.rainfallFrom00To12;
    data['rainfallLastMonth'] = this.rainfallLastMonth;
    data['rainfallJanuaryToLastMonth'] = this.rainfallJanuaryToLastMonth;
    data['tcmessage'] = this.tcmessage;
    if (this.humidity != null) {
      data['humidity'] = this.humidity.toJson();
    }
    return data;
  }
}

class Rainfall {
  List<Data> data;
  String startTime;
  String endTime;

  Rainfall({this.data, this.startTime, this.endTime});

  Rainfall.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    startTime = json['startTime'];
    endTime = json['endTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    return data;
  }
}

class Data {
  String unit;
  String place;
  int max;
  String main;

  Data({this.unit, this.place, this.max, this.main});

  Data.fromJson(Map<String, dynamic> json) {
    unit = json['unit'];
    place = json['place'];
    max = json['max'];
    main = json['main'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['unit'] = this.unit;
    data['place'] = this.place;
    data['max'] = this.max;
    data['main'] = this.main;
    return data;
  }
}

class Temperature {
  List<Data> data;
  String recordTime;

  Temperature({this.data, this.recordTime});

  Temperature.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    recordTime = json['recordTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['recordTime'] = this.recordTime;
    return data;
  }
}

class DataB {
  String place;
  int value;
  String unit;

  DataB({this.place, this.value, this.unit});

  DataB.fromJson(Map<String, dynamic> json) {
    place = json['place'];
    value = json['value'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['place'] = this.place;
    data['value'] = this.value;
    data['unit'] = this.unit;
    return data;
  }
}
