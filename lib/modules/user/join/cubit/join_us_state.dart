part of 'join_us_cubit.dart';

@immutable
abstract class JoinUsState {}

class JoinUsInitial extends JoinUsState {}

class SelectServicesState extends JoinUsState {}


class UploadLoading extends JoinUsState {}
class UploadSuccess extends JoinUsState {}
class UploadError extends JoinUsState {
  String e;
  UploadError(this.e);
}



class JoinUsLoading extends JoinUsState {}
class JoinUsSuccess extends JoinUsState {}
class JoinUsError extends JoinUsState {
  String e;
  JoinUsError(this.e);
}

class GetProfileLoading extends JoinUsState {}
class GetProfileSuccess extends JoinUsState {}
class GetProfileError extends JoinUsState {
  String e;
  GetProfileError(this.e);
}
