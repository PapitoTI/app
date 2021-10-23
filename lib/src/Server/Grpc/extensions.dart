import 'package:app/src/Generated/Protos/common.pb.dart';
import 'package:app/src/Models/guide_model.dart';
import 'package:app/src/Models/itinerary_model.dart';
import 'package:app/src/Models/schedule_model.dart';
import 'package:app/src/Models/spot_model.dart';
import 'package:app/src/Models/tourist_model.dart';
import 'package:intl/intl.dart';

extension TouristGrpc on Tourist {
  TouristModel toModel() => TouristModel(this.profileImageUrl, this.name, this.email, this.phone);
}

extension GuideGrpc on Guide {
  GuideModel toModel() => GuideModel(this.profileImageUrl, this.name, this.email, this.phone, this.certificate, this.accountBalance.toString());
}

extension SpotGrpc on Spot {
  SpotModel toModel() => SpotModel(this.name, this.address, this.category, this.description, this.imageUrls);
}

extension ScheduleGrpc on Schedule {
  ScheduleModel toModel() => ScheduleModel(this.tour.toModel(), this.tourist.toModel(), DateFormat.yMd().add_Hms().parse(this.date), ScheduleStatus.values[this.status]);
}

extension TourGrpc on Tour {
  ItineraryModel toModel() => ItineraryModel
  (
    this.guide.toModel(),
    this.name,
    this.spots.map((e) => e.toModel()).toList(),
    this.durationsInSeconds.map((e) => Duration(seconds: e)).toList(),
    this.description,
    this.category,
    this.weekdays,
    <ExtraSpotModel>[],
    this.price,
    ItineraryType.Guide
  );
}
