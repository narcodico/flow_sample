part of 'app_cubit.dart';

enum AppStatus {
  unauthenticated,
  authenticated,
}

extension AppStatusExtensions on AppStatus {
  bool get isUnauthenticated => this == AppStatus.unauthenticated;
  bool get isAuthenticated => this == AppStatus.authenticated;
}

class AppState extends Equatable {
  const AppState({
    required this.status,
  });

  final AppStatus status;

  @override
  List<Object?> get props => [status];
}
