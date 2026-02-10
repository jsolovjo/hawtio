ARG JAVA_VERSION=17

FROM selenium/standalone-firefox:latest as firefoxImage
USER root
RUN mkdir hawtio-test-suite
WORKDIR hawtio-test-suite
RUN export > env_init.sh
FROM selenium/standalone-chrome:latest as chromeImage

FROM maven:3-eclipse-temurin-${JAVA_VERSION}
COPY --from=firefoxImage / /

COPY --from=chromeImage / /

# Use unique directory to avoid any layer collision with base images
WORKDIR /hawtio-ci-build

# Force cache invalidation with build arg
ARG CACHE_BUST=unknown
RUN echo "Build ID: ${CACHE_BUST}"

# Copy fresh source into unique directory
COPY ./ ./

# Build the test suite
RUN mvn dependency:go-offline -Pe2e -pl :hawtio-test-suite -am -P!local-test-app-dependency
RUN mvn clean install -Pe2e -DskipTests=true -pl :hawtio-test-suite -am -P!local-test-app-dependency

RUN chown root /home/seluser/

# Final working directory for test execution
WORKDIR /hawtio-ci-build/tests/hawtio-test-suite

ENTRYPOINT ["bash" , "./container_entrypoint.sh"]
