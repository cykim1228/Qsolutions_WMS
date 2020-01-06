package kr.co.qsolutions.cowork.Util;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;

public class AlarmTask {

	private static final Logger logger = LoggerFactory.getLogger(AlarmTask.class);

	@Scheduled(cron="*/30 * * * * *")
	public void scheduleRun(){

		Calendar calendar = Calendar.getInstance();
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		System.out.println("스케줄 실행 : " + dateFormat.format(calendar.getTime()));
		
		logger.info("스케줄 실행 : " + dateFormat.format(calendar.getTime()));
		
		// System.out.println("Request " + getCurrentRequest());

	}

}