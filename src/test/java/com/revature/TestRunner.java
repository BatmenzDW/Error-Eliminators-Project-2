package com.revature;

import com.revature.poms.PlanetariumHome;
import com.revature.poms.PlanetariumLogin;
import com.revature.poms.PlanetariumRegistration;
import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.runner.RunWith;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

/*
    When creating automated test suites, it is common to have a "test runner" used to
    facilitate your testing. This allows you to define all the resources you need for testing
    that are shared in one location, where you can handle setup and tear down for those resources
 */
// RunWith tells Junit that we are using the Cucumber testing framework to run our tests
@RunWith(Cucumber.class)
// We need to tell Cucumber where the steps and feature files are located: use @CucumberOptions for this
@CucumberOptions(
        // this tells Cucumber where your step implementations are
        glue = "com.revature.steps",
        // this tells Cucumber where your feature files are
        features = "classpath:features",
        // this tells Cucumber to use a better format for the test results
        // the html plugin tells Cucumber to generate an HTML test report
        plugin = {"pretty", "html:src/test/resources/reports/html-report.html", "json:src/test/resources/reports/json-report.json"}
)
public class TestRunner {
    /*
        since we are using Junit to facilitate our tests, we will make our TestRunner fields public
        and static so we can access them wherever we need them without needing to worry about creating
        an object of the class first
    */
    public static WebDriver driver;

    public static PlanetariumLogin planetariumLogin;
    public static PlanetariumRegistration planetariumRegistration;
    public static PlanetariumHome planetariumHome;

    @BeforeClass
    public static void setup() {
        ChromeOptions options = new ChromeOptions();
//        options.addArguments("headless");

        driver = new ChromeDriver(options);

        planetariumLogin = new PlanetariumLogin(driver);
        planetariumRegistration = new PlanetariumRegistration(driver);
        planetariumHome = new PlanetariumHome(driver);
    }

    @AfterClass
    public static void tearDown(){
        if(driver != null){
            driver.quit();
        }
        Setup.main(new String[]{});
    }
}
