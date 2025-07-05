package runner;

import com.intuit.karate.junit5.Karate;
public class RunnerTest {
    @Karate.Test
    Karate testSample() {
        /*BÁSICO*/
        //return (Karate) Karate.run("classpath:features/reto_karate.feature").tags("@ejercicio1_obtener_usuario_especifico_reqres");
        /*INTERMEDIO*/
        return (Karate) Karate.run("classpath:features/reto_Karate_Intermedio.feature").tags("@ejercicio1_crear_validar_usuario_reqres");
    }}
