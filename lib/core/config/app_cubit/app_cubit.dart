import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/config/theme_repository.dart';
import 'package:graduation_project/features/auth/OTP/presentation/cubit/auth_cubit.dart';
import 'package:graduation_project/features/auth/data/models/edit_profile_data.dart';
import 'package:graduation_project/features/auth/data/models/login_data.dart';
import 'package:graduation_project/features/auth/data/models/register_data.dart';
import 'package:graduation_project/features/community/posts/view%20model/cubit/post_cubit.dart';
import 'package:graduation_project/features/post/post_data.dart';
import 'package:graduation_project/features/profile/edit_user_profile/cubit/edit_profile_cubit.dart';

part 'app_state.dart';


class AppCubit extends Cubit<AppState> {
  final ThemePersistence _themeRepository;
  late StreamSubscription<CustomTheme> _themeSubscription;
  late StreamSubscription<AuthState> _authSubscription;
  late StreamSubscription<PostState> _postSubscription;
  late StreamSubscription<EditProfileState> _editprofileSubscription;
  bool _isDarkTheme = false;
  final AuthCubit _authCubit;
  final PostCubit _postCubit;
  final EditProfileCubit _editProfileCubit;

  AppCubit({
    required ThemePersistence themeRepository,
    required AuthCubit authCubit,
    required PostCubit postCubit,
    required EditProfileCubit editProfileCubit,
  })  : _themeRepository = themeRepository,
        _authCubit = authCubit,
        _postCubit = postCubit,
        _editProfileCubit = editProfileCubit,
        super(AppState(
          themeMode: ThemeMode.light,
          authState: AuthInitial(),
          postState: PostInitial(),
          editProfileState: EditProfileInitial(),
        )) {
    _authSubscription = _authCubit.stream.listen((authState) {
      emit(state.copyWith(authState: authState));
    });
    _postSubscription = _postCubit.stream.listen((postState) {
      emit(state.copyWith(postState: postState));
    });
    _editprofileSubscription = _editProfileCubit.stream.listen((EditProfileState){
      emit(state.copyWith(editProfileState: EditProfileState));
    });
    getCurrentTheme();
  }

  void getCurrentTheme() {
    _themeSubscription = _themeRepository.getTheme().listen(
      (customTheme) {
        if (customTheme == CustomTheme.light) {
          _isDarkTheme = false;
          emit(state.copyWith(themeMode: ThemeMode.light));
        } else {
          _isDarkTheme = true;
          emit(state.copyWith(themeMode: ThemeMode.dark));
        }
      },
    );
  }

  void switchTheme() {
    if (_isDarkTheme) {
      _themeRepository.saveTheme(CustomTheme.light);
    } else {
      _themeRepository.saveTheme(CustomTheme.dark);
    }
    _isDarkTheme = !_isDarkTheme;
  }

  void login(LoginData loginData) {
    _authCubit.login(loginData);
  }

  void register(RegisterData registerData) {
    _authCubit.register(registerData);
  }

  @override
  Future<void> close() {
    _themeSubscription.cancel();
    _authSubscription.cancel();
    _postSubscription.cancel();
    _editprofileSubscription.cancel();
    _themeRepository.dispose();
    return super.close();
  }

  void createPost(PostData postData) async {
    _postCubit.createPost(postData);
  }

  void editProfile(EditProfileData editProfileData) {
    _editProfileCubit.editProfile(editProfileData);
  }
}
