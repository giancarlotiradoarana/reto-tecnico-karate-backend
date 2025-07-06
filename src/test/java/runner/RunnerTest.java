package runner;

import com.intuit.karate.junit5.Karate;

public class RunnerTest {
    @Karate.Test
    Karate runAll() {
        return Karate.run();
    }
}

