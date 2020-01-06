package kr.co.qsolutions.cowork.Task;

import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

@EnableScheduling
@Configuration
public class ExpiredTask {
	
	@Scheduled(cron="*/30 * * * * *")
	public void testMethod() {
		
		System.out.println("test_scheduled");
		
	}
	
}
