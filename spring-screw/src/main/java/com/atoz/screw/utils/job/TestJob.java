package com.atoz.screw.utils.job;

import org.quartz.*;
import org.quartz.impl.StdSchedulerFactory;

/**
 * @description:
 * @author: hao.xu
 * @create: 2020-10-16 15:17
 */

public class TestJob {
    /*public static void main(String[] args) throws SchedulerException {
        //调度器Scheduler
        Scheduler defaultScheduler = StdSchedulerFactory.getDefaultScheduler();
        //触发器
        SimpleTrigger trigger = TriggerBuilder.newTrigger().withIdentity("trigger", "group1").startNow().withSchedule(SimpleScheduleBuilder.simpleSchedule().withIntervalInSeconds(1).repeatForever().withRepeatCount(10)).endAt(
                new GregorianCalendar(2020, 10, 16, 15, 20, 30).getTime()).build();
        //jobDetail
        JobDetail jobDetail = JobBuilder.newJob(HelloJob.class).withIdentity("job1", "group1").build();

        //将jobDetail和触发器加入调度器
        defaultScheduler.scheduleJob(jobDetail,trigger);
        //调度器开始工作
        defaultScheduler.start();
    }*/

//    public static void main(String[] args) throws SchedulerException {
//        //调度器Scheduler
//        Scheduler defaultScheduler = StdSchedulerFactory.getDefaultScheduler();
//        //触发器
//        CronTrigger trigger = TriggerBuilder.newTrigger().withIdentity("trigger", "group1")
//                .withSchedule(CronScheduleBuilder.cronSchedule("*/2 11/2 15,16,17 16 10 ?")).build();
//        //jobDetail
//        JobDetail jobDetail = JobBuilder.newJob(HelloJob.class).withIdentity("job1", "group1").build();
//
//        //将jobDetail和触发器加入调度器
//        defaultScheduler.scheduleJob(jobDetail,trigger);
//        //调度器开始工作
//        defaultScheduler.start();
//    }

    public static void main(String[] args) throws SchedulerException {
        Scheduler defaultScheduler = StdSchedulerFactory.getDefaultScheduler();

        CronTrigger build = TriggerBuilder.newTrigger().withIdentity("job1", "group1").withSchedule(
                CronScheduleBuilder.cronSchedule("* * * 16 10 ?")
        ).build();

        JobDetail build1 = JobBuilder.newJob(HelloJob.class).withIdentity("job", "group1").build();
        defaultScheduler.scheduleJob(build1,build);
        defaultScheduler.start();
    }
}
