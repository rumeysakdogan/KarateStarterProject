function fn() {    
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    spartan_base_url : 'http://52.201.187.226:8000/',
	b20Slogan  : 'VOILA!!!',
	b20Slogan2  : 'Nothing is Impossible',
	b20Slogan3  : 'can you push the code',
	b20Slogan4  : 'Are we there yet?',
	b20Slogan5  : 'zero to Hero!!!!',
	b20Slogan6  : 'Be a good manipulator',
	b20Slogan7  : 'Theeeeeeeeee Documentation',
	b20Slogan8  : 'Take it and use it',
	b20Slogan9  : 'Test test Test',
	b20Slogan10  : 'Hold your horse',
  }
  if (env == 'dev') {
    // customize
    config.b20Slogan5 = 'Release the horse';
  } else if (env == 'e2e') {
    // customize
  }
  return config;
}