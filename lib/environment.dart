enum ServerType { develop, production }

// Development Server Config
var developConfig = {
  //'API_URL': 'http://13.234.116.185/api',
  'API_URL': 'http://192.168.29.13:7171/api/v1',
  'BASE_URL': 'http://192.168.29.13:7171',
};

// Production Server Config
var productionConfig = {
  'API_URL': 'http://3.111.127.103:7171/api/v1',
  'BASE_URL': 'http://3.111.127.103:7171/',
};

class Environment {
  /// Before create a production build change server type
  static ServerType defaultServer = ServerType.production;

  static String getEnvData(key) {
    var serverConfig = (defaultServer == ServerType.develop) ? developConfig : productionConfig;
    return serverConfig[key].toString();
  }

  /// Static links
  static String get playStoreUrl => '';
  static String get appStoreUrl => '';

  /// For server config
  static String get apiUrl => getEnvData('API_URL');
  static String get baseUrl => getEnvData('BASE_URL');
}
