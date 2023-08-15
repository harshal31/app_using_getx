import 'package:app_using_getx/app/data/models/user_profile_entity.dart';
import 'package:app_using_getx/app/data/network/rest_api_base_domain.dart';
import 'package:app_using_getx/app/modules/home_screen/controller/home_page_repository.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  final HomeRepository homeRepository;
  final response = Rx<BaseDomain>(Invalid());
  final profiles = RxList<UserProfileData>();

  HomeScreenController(this.homeRepository);

  @override
  void onInit() {
    super.onInit();
    _fetchProfiles();
  }

  void _fetchProfiles() async {
    response.value = Loading();
    var profiles = await homeRepository.getProfiles();
    profiles.fold((l) {
      response(Invalid());
      this.profiles.addAll(l);
    }, (r) => response.value = r);
  }

  void removeItem(UserProfileData user) {
    profiles.remove(user);
  }

  void addedAsFavorite(int index) {
    profiles[index] = profiles[index].copyWith(isFavorite: !profiles[index].isFavorite);
  }
}
