import 'package:home_care/models/services_model.dart';

List<ServicesModel> getServicesFromMainServices(String mainServicesId) {
  return MainServicesModel.mainServices
      .where((element) => element.id == mainServicesId)
      .first
      .services;
}
