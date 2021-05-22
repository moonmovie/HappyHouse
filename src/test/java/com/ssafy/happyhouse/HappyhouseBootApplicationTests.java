package com.ssafy.happyhouse;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import com.ssafy.happyhouse.util.LocDistance;

@SpringBootTest
class HappyhouseBootApplicationTests {

	@Test
	void contextLoads() {
		LocDistance loc =new LocDistance();
		double d =loc.distance(1.0,2.0,3.0,4.0,"meter");
		System.out.println("확인: "+d);
	}

}
