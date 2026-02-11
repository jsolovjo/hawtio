package io.hawt.tests.features.stepdefinitions.panel.about;

import static org.assertj.core.api.Assertions.assertThat;

import static com.codeborne.selenide.Condition.exactText;
import static com.codeborne.selenide.Condition.exist;
import static com.codeborne.selenide.Selectors.byXpath;
import static com.codeborne.selenide.Selenide.$;

import java.util.Map;

import org.assertj.core.api.Assertions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import io.hawt.tests.features.pageobjects.fragments.about.AboutModalWindow;

public class AboutModalWindowStepDefs {
    private static final Logger log = LoggerFactory.getLogger(AboutModalWindowStepDefs.class);

    @Then("^The \"([^\"]*)\" header is presented in About modal window$")
    public void aboutModalWindowHeaderIsPresented(String header) {
        assertThat(new AboutModalWindow().getHeaderText()).isEqualTo(header);
    }

    @And("^The \"([^\"]*)\" is presented in About modal window$")
    public void hawtioComponentIsPresented(String hawtioComponent) {
        assertThat(new AboutModalWindow().getAppComponents()).containsKey(hawtioComponent);
    }

    @Then("^The Hawtio React version should be captured and verified$")
    public void hawtioReactVersionShouldBeCapturedAndVerified() {
        AboutModalWindow aboutModal = new AboutModalWindow();
        Map<String, String> components = aboutModal.getAppComponents();

        log.info("=== HAWTIO VERSION DEBUG ===");
        log.info("All components in About modal:");
        components.forEach((name, version) -> log.info("  {} = {}", name, version));

        String hawtioReactVersion = components.get("Hawtio React");
        log.info("=== Hawtio React version: {} ===", hawtioReactVersion);

        // Intentionally fail to trigger screenshot capture
        assertThat(hawtioReactVersion)
            .withFailMessage("DEBUG: Hawtio React version captured: %s (This test intentionally fails to generate a screenshot)", hawtioReactVersion)
            .isEqualTo("INTENTIONAL_FAILURE_FOR_SCREENSHOT");
    }
}
