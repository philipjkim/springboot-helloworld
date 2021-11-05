package com.github.philipjkim.springboothelloworld

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class SpringbootHelloWorldApplication

fun main(args: Array<String>) {
    runApplication<SpringbootHelloWorldApplication>(*args)
}
