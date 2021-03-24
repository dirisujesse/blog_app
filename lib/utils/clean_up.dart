import 'package:blog/state/auth_state.dart';
import 'package:blog/state/blog_state.dart';

void clearOut() async {
  BlogState.instance.resetState();
  AuthState.instance.resetState();
}
