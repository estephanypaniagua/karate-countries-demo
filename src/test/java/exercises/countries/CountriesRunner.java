package exercises.countries;

import com.intuit.karate.junit5.Karate;

public class CountriesRunner {

    @Karate.Test
    Karate testUsers() { return Karate.run("users").relativeTo(getClass()); }
}
