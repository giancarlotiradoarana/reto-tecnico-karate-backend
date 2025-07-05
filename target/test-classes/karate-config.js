function fn() {
    var config = {
        baseUrl: 'https://reqres.in/api',
        timeout: 10000,
        idUsuarios: []
    };

    karate.configure('connectTimeout', config.timeout);
    karate.configure('readTimeout', config.timeout);

    karate.log('Base URL utilizada:', config.baseUrl);
    return config;
}

