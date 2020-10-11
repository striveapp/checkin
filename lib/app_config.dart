
class AppConfig {
  final String flavor;

  AppConfig(this.flavor) {
    switch (flavor) {
      case 'dev':
        print("DEV app");
        break;
      case 'prod':
        print("DEV app");
        break;
    }
  }
}
