import 'package:flutter/cupertino.dart';

import '../../data/models/profileModel.dart';
import '../../domain/use_cases/profile_usecase.dart';

final SelectProfileProvider selectProfileProvider = SelectProfileProvider(ProfileUseCase());

class SelectProfileProvider extends ChangeNotifier {

  final ProfileUseCase profileUseCase;

  SelectProfileProvider(this.profileUseCase);

  List<ProfileModel> profiles = [];

  void loadProfiles() {
  }


}