package examples;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;
import java.util.List;

class ExamplesTest {

    @Test
    void testParallel() {
        Results results = Runner.path(
                List.of(
                    "classpath:examples/feature/auth.feature",
                    "classpath:examples/feature/create-booking.feature",
                    "classpath:examples/feature/update-booking.feature"
                )
        ).parallel(1); // Can change to .parallel(5) for parallel run
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

}
