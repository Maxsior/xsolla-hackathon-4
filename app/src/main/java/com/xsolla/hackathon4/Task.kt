package com.xsolla.hackathon4

import java.util.*

enum class Period {
    ONCE, DAILY, WEEKLY, MONTHLY
}

class Task (
    val name: String,
    var done: Date?,
    val period: Period
)