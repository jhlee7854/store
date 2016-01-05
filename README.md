# store
store 프로젝트는 개인 학습을 위한 자바 웹 프로그래밍 입니다.

## 1. Maven 기반의 웹 프로젝트 생성
웹 어플리케이션 개발을 위해 maven기반의 프로젝트를 생성합니다.
테스트 및 로그를 위해 pom.xml에 다음과 같이 의존성을 변경 및 추가 합니다.
추가적으로 servlet-api에 대한 의존성도 추가하였습니다.
```xml
  <dependencies>
    <dependency>
      <groupId>junit</groupId>
      <artifactId>junit</artifactId>
      <version>4.10</version>
      <scope>test</scope>
    </dependency>
    <dependency>
      <groupId>org.slf4j</groupId>
      <artifactId>slf4j-api</artifactId>
      <version>1.7.10</version>
      <scope>compile</scope>
    </dependency>
    <dependency>
    	<groupId>ch.qos.logback</groupId>
    	<artifactId>logback-classic</artifactId>
    	<version>1.1.2</version>
    	<scope>runtime</scope>
    </dependency>
    <dependency>
    	<groupId>javax.servlet</groupId>
    	<artifactId>javax.servlet-api</artifactId>
    	<version>3.1.0</version>
    	<scope>provided</scope>
    </dependency>
  </dependencies>
```

## 2. 로컬에서 웹 어플리케이션 구동을 위한 Maven Plugin 설정
웹 어플리케이션을 로컬에서 구동하기 하여 확인해 볼 수 있도록 Jetty Maven Plugin을 프로젝트에 적용합니다.
추가적으로 Maven Compiler Plugin도 설정하였습니다.
```xml
  <build>
    <finalName>store</finalName>
    <pluginManagement>
   		<plugins>
   			<plugin>
   				<groupId>org.apache.maven.plugins</groupId>
   				<artifactId>maven-compiler-plugin</artifactId>
   				<version>3.2</version>
   				<configuration>
   					<source>1.8</source>
   					<target>1.8</target>
   					<encoding>UTF-8</encoding>
   				</configuration>
   			</plugin>
	    	<plugin>
	    		<groupId>org.eclipse.jetty</groupId>
	    		<artifactId>jetty-maven-plugin</artifactId>
	    		<version>9.3.0.RC1</version>
	    		<configuration>
	    			<scanIntervalSeconds>10</scanIntervalSeconds>
	    			<stopPort>9966</stopPort>
	    			<stopKey>store</stopKey>
	    			<stopWait>10</stopWait>
	    			<webApp>
	    				<contextPath>/${project.artifactId}</contextPath>
	    				<jettyEnvXml>${project.basedir}/src/test/resources/config/jetty/env/jetty-env.xml</jettyEnvXml>
	    			</webApp>
	    		</configuration>
	    		<dependencies>
				    <dependency>
				    	<groupId>org.eclipse.jetty</groupId>
				    	<artifactId>jetty-plus</artifactId>
				    	<version>9.3.0.RC1</version>
				    </dependency>
				    <dependency>
				    	<groupId>org.hsqldb</groupId>
				    	<artifactId>hsqldb</artifactId>
				    	<version>2.3.0</version>
				    </dependency>
				    <dependency>
				    	<groupId>commons-dbcp</groupId>
				    	<artifactId>commons-dbcp</artifactId>
				    	<version>1.2</version>
				    </dependency>
	    		</dependencies>
    		</plugin>
   		</plugins>
    </pluginManagement>
    <plugins>
    	<plugin>
    		<groupId>org.eclipse.jetty</groupId>
    		<artifactId>jetty-maven-plugin</artifactId>
    		<executions>
    			<execution>
    				<id>start-jetty</id>
    				<phase>pre-integration-test</phase>
    				<goals>
    					<goal>start</goal>
    				</goals>
    			</execution>
    			<execution>
    				<id>stop-jetty</id>
    				<phase>post-integration-test</phase>
    				<goals>
    					<goal>stop</goal>
    				</goals>
    			</execution>
    		</executions>
    	</plugin>
    </plugins>
  </build>
```
