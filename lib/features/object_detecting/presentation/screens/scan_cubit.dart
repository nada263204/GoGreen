// import 'package:flutter_bloc/flutter_bloc.dart';

// class ScanCubit extends Cubit<String> {
//   ScanCubit() : super("");

//   void updateRecognition(String recognition) {
//     emit(recognition);
//   }
// }

import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ScanState {}

class ScanInitial extends ScanState {}

class ScanLoading extends ScanState {}

class ScanLoaded extends ScanState {
  final String recognition;

  ScanLoaded(this.recognition);
}

class ScanError extends ScanState {
  final String error;

  ScanError(this.error);
}

class ScanCubit extends Cubit<ScanState> {
  ScanCubit() : super(ScanInitial());

  void updateRecognition(String recognition) {
    emit(ScanLoaded(recognition));
  }

  void setLoading() {
    emit(ScanLoading());
  }

  void setError(String error) {
    emit(ScanError(error));
  }
}
