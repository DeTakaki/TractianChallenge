import '../../utils/request_manager.dart';
import '../domain/asset.dart';
import '../domain/company.dart';
import '../domain/location.dart';
import '../presentation/widgets/app_exception.dart';

class CoreRepository {
  Future<List<Company>> getCompanyAssets() async {
    final response = await RequestManager()
        .restRequest(url: 'companies', method: HttpMethods.patch);

    if (response.statusCode == 200) {
      final companies = (response.data as List)
          .map((company) => Company.fromMap(company))
          .toList();
      return companies;
    } else {
      throw AppException(response.data);
    }
  }

  Future<List<Location>> getLocations({required String companyId}) async {
    final response = await RequestManager().restRequest(
        url: 'companies/$companyId/locations', method: HttpMethods.get);

    if (response.statusCode == 200) {
      final locations = (response.data as List)
          .map((location) => Location.fromMap(location))
          .toList();
      return locations;
    } else {
      throw AppException(response.data);
    }
  }

  Future<List<Asset>> getAssets({required String companyId}) async {
    final response = await RequestManager().restRequest(
      url: 'companies/$companyId/assets',
      method: HttpMethods.get,
    );

    if (response.statusCode == 200) {
      final assets =
          (response.data as List).map((asset) => Asset.fromMap(asset)).toList();
      return assets;
    } else {
      throw AppException(response.data);
    }
  }
}
