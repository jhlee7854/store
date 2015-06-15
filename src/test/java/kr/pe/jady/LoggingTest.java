package kr.pe.jady;

import static org.junit.Assert.*;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LoggingTest {

	@Test
	public void test() {
		Logger logger = LoggerFactory.getLogger(getClass());
		assertNotNull("로거가 존재하지 않습니다.", logger);
		logger.error("로깅 테스트 성공! - error");
		logger.warn("로깅 테스트 성공! - warn");
		logger.info("로깅 테스트 성공! - info");
		logger.debug("로깅 테스트 성공! - debug");
		logger.trace("로깅 테스트 성공! - trace");
	}

}
