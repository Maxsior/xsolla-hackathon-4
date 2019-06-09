package com.xsolla.hackathon4

import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import android.widget.ProgressBar
import android.widget.TextView

class GoalActivity : AppCompatActivity()  {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_goal)

        val name : TextView = findViewById(R.id.name)
        name.setText(goal.name)
        val description : TextView = findViewById(R.id.description)
        description.setText(goal.template)
        val progress : ProgressBar = findViewById(R.id.progress)
        progress.progress = goal.progress
        // TODO (дедлайн, такси, сервисы, мотивация)

    }

    companion object {
        lateinit var goal: Goal
    }
}