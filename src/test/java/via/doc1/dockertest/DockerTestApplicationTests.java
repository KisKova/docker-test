package via.doc1.dockertest;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class DockerTestApplicationTests {

	@Test
	void contextLoads() {
		Assertions.assertTrue(true, "The context loads successfully.");
	}

}
