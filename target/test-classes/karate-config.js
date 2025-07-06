function fn() {
  var config = {
    _baseUrl: 'https://serverest.dev',   // URL base para todas las pruebas
    timeout: 10000,                      // Timeout para peticiones
    schemaPath: 'classpath:schemas/',   // Ruta base para esquemas JSON
    helperPath: 'classpath:helpers/',   // Ruta base para helpers (JS)
  };

  karate.configure('connectTimeout', config.timeout);
  karate.configure('readTimeout', config.timeout);
  karate.configure('ssl', true);

  karate.log('Entorno configurado con base URL:', config._baseUrl);

  return config;
}
