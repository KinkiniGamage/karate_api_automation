package examples;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

class ExamplesTest {

    // @Test
    // void testParallel() {
    //     Results results = Runner.path("classpath:examples")
    //             //.outputCucumberJson(true)
    //             .parallel(5);
    //     assertEquals(0, results.getFailCount(), results.getErrorMessages());
    // }

    @Test
    void testParallel() {
        Results results = Runner.path("classpath:examples") // Pointing to exact feature file
                .parallel(1); // You can increase this number for parallel execution
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

}
