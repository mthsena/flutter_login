abstract class EnvDefault {
  static const appTitle = String.fromEnvironment('APP_TITLE', defaultValue: 'Flutter Login');

  static const fireBaseProjectId = String.fromEnvironment('FIREBASE_PROJECT_ID', defaultValue: 'test-app');
  static const fireBaseAppId = String.fromEnvironment('FIREBASE_APP_ID', defaultValue: 'test-app-d0fa5');
  static const fireBaseMessagingSenderId = String.fromEnvironment('FIREBASE_MESSAGING_SENDER_ID', defaultValue: '260907967341');
  static const fireBaseApiKey = String.fromEnvironment('FIREBASE_API_KEY', defaultValue: 'AIzaSyAgNXV_INxYr7N1r8zHhIx5rHyYeVcBCYk');
}
