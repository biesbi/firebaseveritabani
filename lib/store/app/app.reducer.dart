import '../auth/auth.reducer.dart';
import 'app.state.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    auth: authReducer(state.auth, action),
  );
}
