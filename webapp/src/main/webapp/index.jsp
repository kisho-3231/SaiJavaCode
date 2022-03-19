<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">

    <modelVersion>4.0.0</modelVersion>
    <groupId>SoapClientSd</groupId>
    <artifactId>SoapClientSd</artifactId>
    <version>0.0.2</version>

    <packaging>jar</packaging>
    <name>${project.artifactId}</name>

    <properties>
        <jdk.source>1.7</jdk.source>
        <jdk.target>1.7</jdk.target>
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
        <wsdl>http://localhost:8080/SoapSd/UniboServices?wsdl</wsdl>
        <ws.stub.package.name>it.unibo.test.services</ws.stub.package.name>
        <log4j.version>1.2.17</log4j.version>
        <commons-io.version>2.4</commons-io.version>
        <commons-logging.version>1.2</commons-logging.version>
        <cxf.version>2.5.2</cxf.version>
        <maven-javadoc-plugin.version>2.10.3</maven-javadoc-plugin.version>
        <maven-source-plugin.version>3.0.0</maven-source-plugin.version>
        <maven-compiler-plugin.version>3.6.1</maven-compiler-plugin.version>
    </properties> 

    <build>
        <sourceDirectory>src/main/java</sourceDirectory>
        <pluginManagement>
        <plugins>

            <plugin>
                <groupId>org.apache.cxf</groupId>
                <artifactId>cxf-codegen-plugin</artifactId>
                <version>${cxf.version}</version>
                <executions>

                    <execution>
                        <id>generate-sources</id>
                        <phase>generate-sources</phase>
                        <goals>
                            <goal>wsdl2java</goal>
                        </goals>
                        <configuration>
                            <tasks>
                            </tasks>
                            <sourceRoot>target/generated-sources</sourceRoot>
                            <wsdlOptions>
                                <wsdlOption>
                                    <wsdl>${wsdl}</wsdl>
                                    <extraargs>
                                        <extraarg>-verbose</extraarg>
                                        <extraarg>-client</extraarg>
                                        <extraarg>-frontend</extraarg>
                                        <extraarg>jaxws21</extraarg>
                                        <extraarg>-p</extraarg>
                                        <extraarg>${ws.stub.package.name}</extraarg>
                                    </extraargs>
                                </wsdlOption>
                            </wsdlOptions>
                        </configuration>
                    </execution>
                </executions>
            </plugin>

            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-compiler-plugin</artifactId>
                <version>${maven-compiler-plugin.version}</version>
                <configuration>
                    <source>${jdk.source}</source>
                    <target>${jdk.target}</target>
                </configuration>
            </plugin>

            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-source-plugin</artifactId>
                <version>${maven-source-plugin.version}</version>
                <executions>
                    <execution>
                        <id>attach-sources</id>
                        <goals>
                            <goal>jar</goal>
                        </goals>
                    </execution>
                </executions>
            </plugin>

            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-javadoc-plugin</artifactId>
                <version>${maven-javadoc-plugin.version}</version>
                <executions>
                    <execution>
                        <id>attach-javadocs</id>
                        <goals>
                            <goal>jar</goal>
                        </goals>
                        <configuration>
                            <additionalparam>${javadoc.opts}</additionalparam>
                        </configuration>
                    </execution>
                </executions>
            </plugin>

            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-site-plugin</artifactId>
                <version>3.3</version>
                <configuration>
                    <reportPlugins>
                        <plugin>
                            <groupId>org.apache.maven.plugins</groupId>
                            <artifactId>maven-javadoc-plugin</artifactId>
                            <configuration>
                                <additionalparam>${javadoc.opts}</additionalparam>
                            </configuration>
                        </plugin>
                    </reportPlugins>
                </configuration>
            </plugin>
        </plugins>
    </pluginManagement>
    </build>

    <dependencies>
        <dependency>
            <groupId>org.apache.cxf</groupId>
            <artifactId>cxf-bundle</artifactId>
            <version>${cxf.version}</version>
            <scope>provided</scope>
        </dependency>

        <dependency>
            <groupId>log4j</groupId>
            <artifactId>log4j</artifactId>
            <version>${log4j.version}</version>
        </dependency>
    </dependencies>
</project>
