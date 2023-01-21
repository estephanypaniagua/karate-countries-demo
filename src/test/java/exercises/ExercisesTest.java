package exercises;

import com.intuit.karate.junit5.Karate;

public class ExercisesTest {

    @Karate.Test
    Karate testAll() { return Karate.run().relativeTo(getClass()); }
}
