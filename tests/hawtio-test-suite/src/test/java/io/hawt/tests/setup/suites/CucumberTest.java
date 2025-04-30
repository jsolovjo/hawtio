package io.hawt.tests.setup.suites;

import org.junit.platform.suite.api.ConfigurationParameter;
import org.junit.platform.suite.api.IncludeEngines;
import org.junit.platform.suite.api.SelectClasspathResource;
import org.junit.platform.suite.api.Suite;

@Suite
@IncludeEngines("cucumber")
@SelectClasspathResource("io/hawt/tests/features/")
@ConfigurationParameter(key = "cucumber.publish.enabled", value = "false")
public class CucumberTest {

}
