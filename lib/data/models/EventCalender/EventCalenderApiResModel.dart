import 'dart:convert';
/// status : 1
/// message : "Event Calender List"
/// response : {"event_sports":[{"sport":"Alpine Skiing"},{"sport":"American Football"},{"sport":"Aquatics"},{"sport":"Archery"},{"sport":"Athletics"},{"sport":"Badminton"},{"sport":"Baseball"},{"sport":"Basketball"},{"sport":"Beach Volleyball"},{"sport":"Biathlon"},{"sport":"Boxing"},{"sport":"Canoe Slalom"},{"sport":"Canoe Sprint"},{"sport":"Canoeing"},{"sport":"Car Racing"},{"sport":"Cricket"},{"sport":"Cross-country Skiing"},{"sport":"Curling"},{"sport":"Cyling"},{"sport":"Darts"},{"sport":"Fencing"},{"sport":"Field Hockey"},{"sport":"Figure Skating"},{"sport":"Football"},{"sport":"Formula One"},{"sport":"Golf"},{"sport":"Gymnastics"},{"sport":"Handball"},{"sport":"Ice Hockey"},{"sport":"Indycar"},{"sport":"Judo"},{"sport":"Karate"},{"sport":"Luge"},{"sport":"Modern Pentathlon"},{"sport":"Moto Racing"},{"sport":"Multi Sport"},{"sport":"Multi-sport"},{"sport":"Nordic Skiing"},{"sport":"Rowing"},{"sport":"Rugby Union"},{"sport":"Shooting"},{"sport":"Short-track Speed Skating"},{"sport":"Ski Jumping"},{"sport":"Snooker"},{"sport":"Sport Climbing"},{"sport":"Table Tennis"},{"sport":"Tennis"},{"sport":"Triathlon"},{"sport":"Volleyball"},{"sport":"Weightlifting"},{"sport":"Wrestling"}],"event_seasons":[{"year":"2023"},{"year":"2022"}],"series_data":[{"series":"Afc Asian Cup"},{"series":"Alpine Skiing World Cup"},{"series":"Arca Menards Series"},{"series":"Atp Tour - 250"},{"series":"Atp Tour - 250 / Wta Tour - 250"},{"series":"Atp Tour - 250 / Wta Tour - 500"},{"series":"Atp Tour - 500"},{"series":"Atp Tour - 500 / Wta Tour - 250"},{"series":"Atp Tour - Finals"},{"series":"Atp Tour - Masters 1000"},{"series":"Atp Tour - Masters 1000 / Wta Tour - 1000"},{"series":"Bwf World Tour Super 100"},{"series":"Bwf World Tour Super 1000"},{"series":"Bwf World Tour Super 300"},{"series":"Bwf World Tour Super 500"},{"series":"Bwf World Tour Super 750"},{"series":"Diamond League"},{"series":"Fifa U-17 World Cup"},{"series":"Fifa U-20 World Cup"},{"series":"Fifa Women's World Cup"},{"series":"Formula One Championship"},{"series":"Grand Slam"},{"series":"Icc Women's T20 World Cup"},{"series":"Indy Nxt"},{"series":"Indycar Series"},{"series":"Men's Fih Hockey World Cup"},{"series":"Men's Fih Indoor Hockey World Cup"},{"series":"Motogp World Championship"},{"series":"Nascar Craftsman Truck Series"},{"series":"Nascar Cup Series"},{"series":"Nascar Xfinity Series"},{"series":"Pga Tour"},{"series":"Supercars Championship"},{"series":"The Ashes"},{"series":"Uci World Tour"},{"series":"Under-19 Women's T20 World Cup"},{"series":"Women's Fih Indoor Hockey World Cup"},{"series":"World Snooker Tour"},{"series":"Wta Tour - 1000"},{"series":"Wta Tour - 250"},{"series":"Wta Tour - 500"}],"event_months":["january","february","march","april","may","june","july","august","september","october","november","december"],"event_list":[{"eventid":517,"year":"2023","month":"January","sport":"Tennis","event_date":"2  Jan 2023","event":"Maharashtra Open","venue":"India","series":"Atp Tour - 250","event_status":"International","major_event":"","fixture_link":""},{"eventid":524,"year":"2023","month":"February","sport":"Tennis","event_date":"6  Feb 2023","event":"Cordoba Open","venue":"Argentina","series":"Atp Tour - 250","event_status":"International","major_event":"","fixture_link":""},{"eventid":526,"year":"2023","month":"February","sport":"Tennis","event_date":"6  Feb 2023","event":"Open Sud de France","venue":"France","series":"Atp Tour - 250","event_status":"International","major_event":"","fixture_link":""},{"eventid":527,"year":"2023","month":"February","sport":"Tennis","event_date":"6  Feb 2023","event":"Dallas Open","venue":"United States","series":"Atp Tour - 250","event_status":"International","major_event":"","fixture_link":""}],"page_links":{"current_page":1,"per_page":"4","first_page_url":"https://spoogle.in/dev/api/events/event-calenders?page=1","from":1,"last_page":8,"last_page_url":"https://spoogle.in/dev/api/events/event-calenders?page=8","next_page_url":"https://spoogle.in/dev/api/events/event-calenders?page=2","path":"https://spoogle.in/dev/api/events/event-calenders","prev_page_url":"","to":4,"total":32}}

EventCalenderApiResModel eventCalenderApiResModelFromJson(String str) => EventCalenderApiResModel.fromJson(json.decode(str));
String eventCalenderApiResModelToJson(EventCalenderApiResModel data) => json.encode(data.toJson());
class EventCalenderApiResModel {
  EventCalenderApiResModel({
      dynamic status, 
      String? message, 
      Response? response,}){
    _status = status;
    _message = message;
    _response = response;
}

  EventCalenderApiResModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _response = json['response'] != null ? Response.fromJson(json['response']) : null;
  }
  dynamic _status;
  String? _message;
  Response? _response;
EventCalenderApiResModel copyWith({  dynamic status,
  String? message,
  Response? response,
}) => EventCalenderApiResModel(  status: status ?? _status,
  message: message ?? _message,
  response: response ?? _response,
);
  dynamic get status => _status;
  String? get message => _message;
  Response? get response => _response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_response != null) {
      map['response'] = _response?.toJson();
    }
    return map;
  }

}

/// event_sports : [{"sport":"Alpine Skiing"},{"sport":"American Football"},{"sport":"Aquatics"},{"sport":"Archery"},{"sport":"Athletics"},{"sport":"Badminton"},{"sport":"Baseball"},{"sport":"Basketball"},{"sport":"Beach Volleyball"},{"sport":"Biathlon"},{"sport":"Boxing"},{"sport":"Canoe Slalom"},{"sport":"Canoe Sprint"},{"sport":"Canoeing"},{"sport":"Car Racing"},{"sport":"Cricket"},{"sport":"Cross-country Skiing"},{"sport":"Curling"},{"sport":"Cyling"},{"sport":"Darts"},{"sport":"Fencing"},{"sport":"Field Hockey"},{"sport":"Figure Skating"},{"sport":"Football"},{"sport":"Formula One"},{"sport":"Golf"},{"sport":"Gymnastics"},{"sport":"Handball"},{"sport":"Ice Hockey"},{"sport":"Indycar"},{"sport":"Judo"},{"sport":"Karate"},{"sport":"Luge"},{"sport":"Modern Pentathlon"},{"sport":"Moto Racing"},{"sport":"Multi Sport"},{"sport":"Multi-sport"},{"sport":"Nordic Skiing"},{"sport":"Rowing"},{"sport":"Rugby Union"},{"sport":"Shooting"},{"sport":"Short-track Speed Skating"},{"sport":"Ski Jumping"},{"sport":"Snooker"},{"sport":"Sport Climbing"},{"sport":"Table Tennis"},{"sport":"Tennis"},{"sport":"Triathlon"},{"sport":"Volleyball"},{"sport":"Weightlifting"},{"sport":"Wrestling"}]
/// event_seasons : [{"year":"2023"},{"year":"2022"}]
/// series_data : [{"series":"Afc Asian Cup"},{"series":"Alpine Skiing World Cup"},{"series":"Arca Menards Series"},{"series":"Atp Tour - 250"},{"series":"Atp Tour - 250 / Wta Tour - 250"},{"series":"Atp Tour - 250 / Wta Tour - 500"},{"series":"Atp Tour - 500"},{"series":"Atp Tour - 500 / Wta Tour - 250"},{"series":"Atp Tour - Finals"},{"series":"Atp Tour - Masters 1000"},{"series":"Atp Tour - Masters 1000 / Wta Tour - 1000"},{"series":"Bwf World Tour Super 100"},{"series":"Bwf World Tour Super 1000"},{"series":"Bwf World Tour Super 300"},{"series":"Bwf World Tour Super 500"},{"series":"Bwf World Tour Super 750"},{"series":"Diamond League"},{"series":"Fifa U-17 World Cup"},{"series":"Fifa U-20 World Cup"},{"series":"Fifa Women's World Cup"},{"series":"Formula One Championship"},{"series":"Grand Slam"},{"series":"Icc Women's T20 World Cup"},{"series":"Indy Nxt"},{"series":"Indycar Series"},{"series":"Men's Fih Hockey World Cup"},{"series":"Men's Fih Indoor Hockey World Cup"},{"series":"Motogp World Championship"},{"series":"Nascar Craftsman Truck Series"},{"series":"Nascar Cup Series"},{"series":"Nascar Xfinity Series"},{"series":"Pga Tour"},{"series":"Supercars Championship"},{"series":"The Ashes"},{"series":"Uci World Tour"},{"series":"Under-19 Women's T20 World Cup"},{"series":"Women's Fih Indoor Hockey World Cup"},{"series":"World Snooker Tour"},{"series":"Wta Tour - 1000"},{"series":"Wta Tour - 250"},{"series":"Wta Tour - 500"}]
/// event_months : ["january","february","march","april","may","june","july","august","september","october","november","december"]
/// event_list : [{"eventid":517,"year":"2023","month":"January","sport":"Tennis","event_date":"2  Jan 2023","event":"Maharashtra Open","venue":"India","series":"Atp Tour - 250","event_status":"International","major_event":"","fixture_link":""},{"eventid":524,"year":"2023","month":"February","sport":"Tennis","event_date":"6  Feb 2023","event":"Cordoba Open","venue":"Argentina","series":"Atp Tour - 250","event_status":"International","major_event":"","fixture_link":""},{"eventid":526,"year":"2023","month":"February","sport":"Tennis","event_date":"6  Feb 2023","event":"Open Sud de France","venue":"France","series":"Atp Tour - 250","event_status":"International","major_event":"","fixture_link":""},{"eventid":527,"year":"2023","month":"February","sport":"Tennis","event_date":"6  Feb 2023","event":"Dallas Open","venue":"United States","series":"Atp Tour - 250","event_status":"International","major_event":"","fixture_link":""}]
/// page_links : {"current_page":1,"per_page":"4","first_page_url":"https://spoogle.in/dev/api/events/event-calenders?page=1","from":1,"last_page":8,"last_page_url":"https://spoogle.in/dev/api/events/event-calenders?page=8","next_page_url":"https://spoogle.in/dev/api/events/event-calenders?page=2","path":"https://spoogle.in/dev/api/events/event-calenders","prev_page_url":"","to":4,"total":32}

Response responseFromJson(String str) => Response.fromJson(json.decode(str));
String responseToJson(Response data) => json.encode(data.toJson());
class Response {
  Response({
      List<EventSports>? eventSports, 
      List<EventSeasons>? eventSeasons, 
      List<SeriesData>? seriesData, 
      List<String>? eventMonths, 
      List<EventList>? eventList, 
      PageLinks? pageLinks,}){
    _eventSports = eventSports;
    _eventSeasons = eventSeasons;
    _seriesData = seriesData;
    _eventMonths = eventMonths;
    _eventList = eventList;
    _pageLinks = pageLinks;
}

  Response.fromJson(dynamic json) {
    if (json['event_sports'] != null) {
      _eventSports = [];
      json['event_sports'].forEach((v) {
        _eventSports?.add(EventSports.fromJson(v));
      });
    }
    if (json['event_seasons'] != null) {
      _eventSeasons = [];
      json['event_seasons'].forEach((v) {
        _eventSeasons?.add(EventSeasons.fromJson(v));
      });
    }
    if (json['series_data'] != null) {
      _seriesData = [];
      json['series_data'].forEach((v) {
        _seriesData?.add(SeriesData.fromJson(v));
      });
    }
    _eventMonths = json['event_months'] != null ? json['event_months'].cast<String>() : [];
    if (json['event_list'] != null) {
      _eventList = [];
      json['event_list'].forEach((v) {
        _eventList?.add(EventList.fromJson(v));
      });
    }
    _pageLinks = json['page_links'] != null ? PageLinks.fromJson(json['page_links']) : null;
  }
  List<EventSports>? _eventSports;
  List<EventSeasons>? _eventSeasons;
  List<SeriesData>? _seriesData;
  List<String>? _eventMonths;
  List<EventList>? _eventList;
  PageLinks? _pageLinks;
Response copyWith({  List<EventSports>? eventSports,
  List<EventSeasons>? eventSeasons,
  List<SeriesData>? seriesData,
  List<String>? eventMonths,
  List<EventList>? eventList,
  PageLinks? pageLinks,
}) => Response(  eventSports: eventSports ?? _eventSports,
  eventSeasons: eventSeasons ?? _eventSeasons,
  seriesData: seriesData ?? _seriesData,
  eventMonths: eventMonths ?? _eventMonths,
  eventList: eventList ?? _eventList,
  pageLinks: pageLinks ?? _pageLinks,
);
  List<EventSports>? get eventSports => _eventSports;
  List<EventSeasons>? get eventSeasons => _eventSeasons;
  List<SeriesData>? get seriesData => _seriesData;
  List<String>? get eventMonths => _eventMonths;
  List<EventList>? get eventList => _eventList;
  PageLinks? get pageLinks => _pageLinks;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_eventSports != null) {
      map['event_sports'] = _eventSports?.map((v) => v.toJson()).toList();
    }
    if (_eventSeasons != null) {
      map['event_seasons'] = _eventSeasons?.map((v) => v.toJson()).toList();
    }
    if (_seriesData != null) {
      map['series_data'] = _seriesData?.map((v) => v.toJson()).toList();
    }
    map['event_months'] = _eventMonths;
    if (_eventList != null) {
      map['event_list'] = _eventList?.map((v) => v.toJson()).toList();
    }
    if (_pageLinks != null) {
      map['page_links'] = _pageLinks?.toJson();
    }
    return map;
  }

}

/// current_page : 1
/// per_page : "4"
/// first_page_url : "https://spoogle.in/dev/api/events/event-calenders?page=1"
/// from : 1
/// last_page : 8
/// last_page_url : "https://spoogle.in/dev/api/events/event-calenders?page=8"
/// next_page_url : "https://spoogle.in/dev/api/events/event-calenders?page=2"
/// path : "https://spoogle.in/dev/api/events/event-calenders"
/// prev_page_url : ""
/// to : 4
/// total : 32

PageLinks pageLinksFromJson(String str) => PageLinks.fromJson(json.decode(str));
String pageLinksToJson(PageLinks data) => json.encode(data.toJson());
class PageLinks {
  PageLinks({
      dynamic currentPage, 
      String? perPage, 
      String? firstPageUrl, 
      dynamic from, 
      dynamic lastPage, 
      String? lastPageUrl, 
      String? nextPageUrl, 
      String? path, 
      String? prevPageUrl, 
      dynamic to, 
      dynamic total,}){
    _currentPage = currentPage;
    _perPage = perPage;
    _firstPageUrl = firstPageUrl;
    _from = from;
    _lastPage = lastPage;
    _lastPageUrl = lastPageUrl;
    _nextPageUrl = nextPageUrl;
    _path = path;
    _prevPageUrl = prevPageUrl;
    _to = to;
    _total = total;
}

  PageLinks.fromJson(dynamic json) {
    _currentPage = json['current_page'];
    _perPage = json['per_page'];
    _firstPageUrl = json['first_page_url'];
    _from = json['from'];
    _lastPage = json['last_page'];
    _lastPageUrl = json['last_page_url'];
    _nextPageUrl = json['next_page_url'];
    _path = json['path'];
    _prevPageUrl = json['prev_page_url'];
    _to = json['to'];
    _total = json['total'];
  }
  dynamic _currentPage;
  String? _perPage;
  String? _firstPageUrl;
  dynamic _from;
  dynamic _lastPage;
  String? _lastPageUrl;
  String? _nextPageUrl;
  String? _path;
  String? _prevPageUrl;
  dynamic _to;
  dynamic _total;
PageLinks copyWith({  dynamic currentPage,
  String? perPage,
  String? firstPageUrl,
  dynamic from,
  dynamic lastPage,
  String? lastPageUrl,
  String? nextPageUrl,
  String? path,
  String? prevPageUrl,
  dynamic to,
  dynamic total,
}) => PageLinks(  currentPage: currentPage ?? _currentPage,
  perPage: perPage ?? _perPage,
  firstPageUrl: firstPageUrl ?? _firstPageUrl,
  from: from ?? _from,
  lastPage: lastPage ?? _lastPage,
  lastPageUrl: lastPageUrl ?? _lastPageUrl,
  nextPageUrl: nextPageUrl ?? _nextPageUrl,
  path: path ?? _path,
  prevPageUrl: prevPageUrl ?? _prevPageUrl,
  to: to ?? _to,
  total: total ?? _total,
);
  dynamic get currentPage => _currentPage;
  String? get perPage => _perPage;
  String? get firstPageUrl => _firstPageUrl;
  dynamic get from => _from;
  dynamic get lastPage => _lastPage;
  String? get lastPageUrl => _lastPageUrl;
  String? get nextPageUrl => _nextPageUrl;
  String? get path => _path;
  String? get prevPageUrl => _prevPageUrl;
  dynamic get to => _to;
  dynamic get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_page'] = _currentPage;
    map['per_page'] = _perPage;
    map['first_page_url'] = _firstPageUrl;
    map['from'] = _from;
    map['last_page'] = _lastPage;
    map['last_page_url'] = _lastPageUrl;
    map['next_page_url'] = _nextPageUrl;
    map['path'] = _path;
    map['prev_page_url'] = _prevPageUrl;
    map['to'] = _to;
    map['total'] = _total;
    return map;
  }

}

/// eventid : 517
/// year : "2023"
/// month : "January"
/// sport : "Tennis"
/// event_date : "2  Jan 2023"
/// event : "Maharashtra Open"
/// venue : "India"
/// series : "Atp Tour - 250"
/// event_status : "International"
/// major_event : ""
/// fixture_link : ""

EventList eventListFromJson(String str) => EventList.fromJson(json.decode(str));
String eventListToJson(EventList data) => json.encode(data.toJson());
class EventList {
  EventList({
      dynamic eventid, 
      String? year, 
      String? month, 
      String? sport, 
      String? eventDate, 
      String? event, 
      String? venue, 
      String? series, 
      String? eventStatus, 
      String? majorEvent, 
      String? fixtureLink,}){
    _eventid = eventid;
    _year = year;
    _month = month;
    _sport = sport;
    _eventDate = eventDate;
    _event = event;
    _venue = venue;
    _series = series;
    _eventStatus = eventStatus;
    _majorEvent = majorEvent;
    _fixtureLink = fixtureLink;
}

  EventList.fromJson(dynamic json) {
    _eventid = json['eventid'];
    _year = json['year'];
    _month = json['month'];
    _sport = json['sport'];
    _eventDate = json['event_date'];
    _event = json['event'];
    _venue = json['venue'];
    _series = json['series'];
    _eventStatus = json['event_status'];
    _majorEvent = json['major_event'];
    _fixtureLink = json['fixture_link'];
  }
  dynamic _eventid;
  String? _year;
  String? _month;
  String? _sport;
  String? _eventDate;
  String? _event;
  String? _venue;
  String? _series;
  String? _eventStatus;
  String? _majorEvent;
  String? _fixtureLink;
EventList copyWith({  dynamic eventid,
  String? year,
  String? month,
  String? sport,
  String? eventDate,
  String? event,
  String? venue,
  String? series,
  String? eventStatus,
  String? majorEvent,
  String? fixtureLink,
}) => EventList(  eventid: eventid ?? _eventid,
  year: year ?? _year,
  month: month ?? _month,
  sport: sport ?? _sport,
  eventDate: eventDate ?? _eventDate,
  event: event ?? _event,
  venue: venue ?? _venue,
  series: series ?? _series,
  eventStatus: eventStatus ?? _eventStatus,
  majorEvent: majorEvent ?? _majorEvent,
  fixtureLink: fixtureLink ?? _fixtureLink,
);
  dynamic get eventid => _eventid;
  String? get year => _year;
  String? get month => _month;
  String? get sport => _sport;
  String? get eventDate => _eventDate;
  String? get event => _event;
  String? get venue => _venue;
  String? get series => _series;
  String? get eventStatus => _eventStatus;
  String? get majorEvent => _majorEvent;
  String? get fixtureLink => _fixtureLink;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['eventid'] = _eventid;
    map['year'] = _year;
    map['month'] = _month;
    map['sport'] = _sport;
    map['event_date'] = _eventDate;
    map['event'] = _event;
    map['venue'] = _venue;
    map['series'] = _series;
    map['event_status'] = _eventStatus;
    map['major_event'] = _majorEvent;
    map['fixture_link'] = _fixtureLink;
    return map;
  }

}

/// series : "Afc Asian Cup"

SeriesData seriesDataFromJson(String str) => SeriesData.fromJson(json.decode(str));
String seriesDataToJson(SeriesData data) => json.encode(data.toJson());
class SeriesData {
  SeriesData({
      String? series,}){
    _series = series;
}

  SeriesData.fromJson(dynamic json) {
    _series = json['series'];
  }
  String? _series;
SeriesData copyWith({  String? series,
}) => SeriesData(  series: series ?? _series,
);
  String? get series => _series;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['series'] = _series;
    return map;
  }

}

/// year : "2023"

EventSeasons eventSeasonsFromJson(String str) => EventSeasons.fromJson(json.decode(str));
String eventSeasonsToJson(EventSeasons data) => json.encode(data.toJson());
class EventSeasons {
  EventSeasons({
      String? year,}){
    _year = year;
}

  EventSeasons.fromJson(dynamic json) {
    _year = json['year'];
  }
  String? _year;
EventSeasons copyWith({  String? year,
}) => EventSeasons(  year: year ?? _year,
);
  String? get year => _year;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['year'] = _year;
    return map;
  }

}

/// sport : "Alpine Skiing"

EventSports eventSportsFromJson(String str) => EventSports.fromJson(json.decode(str));
String eventSportsToJson(EventSports data) => json.encode(data.toJson());
class EventSports {
  EventSports({
      String? sport,}){
    _sport = sport;
}

  EventSports.fromJson(dynamic json) {
    _sport = json['sport'];
  }
  String? _sport;
EventSports copyWith({  String? sport,
}) => EventSports(  sport: sport ?? _sport,
);
  String? get sport => _sport;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sport'] = _sport;
    return map;
  }

}