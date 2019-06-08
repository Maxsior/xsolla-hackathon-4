package com.xsolla.hackathon4

import java.util.*

class Goal (
    val name: String,
    val deadline: Date,
    val template: String,
    val vars: ArrayList<String>,
    val tasks: ArrayList<Task>,
    val motivation: String,
    val services: ArrayList<String>
)