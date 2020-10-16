package com.atoz.screw.utils.job;

import org.quartz.Job;
import org.quartz.JobDetail;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import java.util.Date;


/**
 * @description:
 * @author: hao.xu
 * @create: 2020-10-16 14:58
 */

public class HelloJob implements Job {
    @Override
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        JobDetail jobDetail = jobExecutionContext.getJobDetail();
        System.out.println(jobDetail.getKey()+":"+jobDetail.getKey().getName());
        System.out.println("快乐 hello quartz job"+new Date());
    }
}
