package com.xsolla.hackathon4

import android.content.Intent
import android.os.Bundle
import android.support.v4.view.ViewPager
import android.support.v7.app.AppCompatActivity
import android.view.View
import kotlinx.android.synthetic.main.activity_main.*
import java.io.File
import java.time.LocalDate

class MainActivity : AppCompatActivity() {

    lateinit var viewPager: ViewPager
    lateinit var goalPagerAdapter: GoalPagerAdapter

    override fun onCreate(savedInstanceState: Bundle?) {

        var tmp = arrayListOf<Goal>(
            Goal("Цель НЕ всё", LocalDate.parse("2019-11-02"), "Ничо не хочу", arrayListOf(), arrayListOf(), "", arrayListOf(), 13)
        )

        val file = File(filesDir,"file.json")
        file.writeText("""[
  {
    "name": "Цель НЕ всё",
    "deadline": "2019-06-09T00:31:12.106Z",
    "template": "Ничо не хочу",
    "vars": [],
    "tasks": [],
    "motivation": "",
    "services": [],
    "progress": 13
  },
  {
    "name": "Цель всё",
    "deadline": "2019-06-09T00:31:12.106Z",
    "template": "Всё хочу",
    "vars": [],
    "tasks": [],
    "motivation": "",
    "services": [],
    "progress": 100
  }
]
""")


        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        goalPagerAdapter = GoalPagerAdapter(supportFragmentManager, this)

        viewPager = findViewById(R.id.viewPager)
        viewPager.adapter = goalPagerAdapter

        tabLayout.setupWithViewPager(viewPager)

    }


    fun goalClicked(view: View) {
        val goalIntent = Intent(this, GoalActivity::class.java)
        GoalActivity.goal = view.tag as Goal
        startActivity(goalIntent)
    }


}
