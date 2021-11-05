package com.github.philipjkim.springboothelloworld

import org.slf4j.LoggerFactory
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.RestController
import java.time.ZoneId
import java.time.ZonedDateTime

@RestController
@RequestMapping("/")
class HelloController {

    private val appStartedAt = ZonedDateTime.now(ZoneId.of("+0"))
    private val logger = LoggerFactory.getLogger(this::class.java)

    @GetMapping("/ping")
    fun ping() = ResponseEntity.ok(mapOf("appStartedAt" to appStartedAt))

    @GetMapping("/hello")
    fun hello(@RequestParam("user") user: String?) =
        mapOf("data" to "Hello, ${user ?: "world"}")
            .also { logger.info("response => $it") }
            .let { ResponseEntity.ok(it) }
}
