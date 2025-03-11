import 'package:flutter/cupertino.dart';
import '../../data/models/profileModel.dart';
import '../../domain/use_cases/profile_use_case.dart';

final SelectProfileProvider selectProfileProvider = SelectProfileProvider(ProfileUseCase(sharedPrefRepository));

class SelectProfileProvider extends ChangeNotifier {

  final ProfileUseCase profileUseCase;

  SelectProfileProvider(this.profileUseCase);

  List<ProfileModel> profiles = [];

  void loadProfiles() {
    profiles = profileUseCase.getProfiles();
    notifyListeners();
  }
}