import 'package:aviator_delivery/data/repository/onboarding_repository.dart';
import 'package:bloc/bloc.dart';

import 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit(this.onboardingRepository) : super(OnboardingState(true));
  final OnboardingRepository onboardingRepository;

  Future<void> checkFirstTime() async {
    bool isFirstTime = await onboardingRepository.checkFirstTime();
    emit(OnboardingState(isFirstTime));
  }

  Future<void> setFirstTime() async {
    await onboardingRepository.setFirstTime();

    emit(OnboardingState(false));
  }
}
