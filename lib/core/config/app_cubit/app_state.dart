part of 'app_cubit.dart';

class AppState extends Equatable {
  final ThemeMode themeMode;
  final AuthState authState;
  final PostState postState;
  final EditProfileState editProfileState;

  const AppState({
    required this.themeMode,
    required this.authState,
    required this.postState,
    required this.editProfileState,
  });

  get message => null;

  AppState copyWith({
    ThemeMode? themeMode,
    AuthState? authState,
    PostState? postState,
    EditProfileState? editProfileState,
  }) {
    return AppState(
      themeMode: themeMode ?? this.themeMode,
      authState: authState ?? this.authState,
      postState: postState ?? this.postState,
      editProfileState: editProfileState ?? this.editProfileState,
    );
  }

  @override
  List<Object?> get props => [themeMode, authState, postState, editProfileState];
}
