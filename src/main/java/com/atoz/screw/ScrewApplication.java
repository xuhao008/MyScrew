package com.atoz.screw;

import net.hasor.spring.boot.EnableHasor;
import net.hasor.spring.boot.EnableHasorWeb;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@EnableHasor
@EnableHasorWeb
@SpringBootApplication
public class ScrewApplication {

    public static void main(String[] args) {
        SpringApplication.run(ScrewApplication.class, args);
    }

}
