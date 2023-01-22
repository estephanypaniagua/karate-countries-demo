function fn() {
  // get java env API_KEY
  var apiKeyValue = java.lang.System.getenv("API_KEY");

  // get java system property 'karate.env'
  var env = karate.env;
  karate.log('karate.env system property was:', env);

  // base config JSON
  var config = {
    urlBase: 'http://api.countrylayer.com/v2',
    pathAll: 'all',
    pathAlpha: 'alpha',
    pathName: 'name',
    apiKeyValue: apiKeyValue,
  };

  // don't waste time waiting for a connection or if servers don't respond within 5 seconds
  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);
  return config;
}

