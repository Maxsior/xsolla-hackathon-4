package com.xsolla.hackathon4

import android.content.Intent
import android.os.Bundle
import android.support.v4.view.ViewPager
import android.support.v7.app.AppCompatActivity
import android.view.View
import android.widget.Toast
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
    "tasks": [ {"name": "Купить книгу", "done": "2019-05-09T12:11:45:11Z", "period": 0}, {"name": "Читать 10 страниц в день", "done": "2019-05-09T12:11:45:11Z", "period": 7}],
    "motivation": "",
    "services": ["http://stepik.org/", "http://stepik.org/", "http://stepik.org/", "http://stepik.org/", "http://stepik.org/", "http://stepik.org/"],
    "progress": 47
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
  },
  {
    "name": "Цель тоже всё",
    "deadline": "2019-06-09T07:31:12.106Z",
    "template": "больше хочу",
    "vars": [],
    "tasks": [],
    "motivation": "",
    "services": [],
    "progress": 100
  },
  {
    "name": "Цель почти",
    "deadline": "2019-06-09T07:31:12.106Z",
    "template": "Ещё хочу",
    "vars": [],
    "tasks": [],
    "motivation": "",
    "services": [],
    "progress": 90
  },
  {
    "name": "Цель чуток",
    "deadline": "2019-06-09T07:31:12.106Z",
    "template": "уже не хочу",
    "vars": [],
    "tasks": [],
    "motivation": "",
    "services": [],
    "progress": 10
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

    fun addGoal(view: View) {
        Toast.makeText(this, "Шёл медведь по лесу, видит -- машина горит, сел в неё и сгорел", Toast.LENGTH_LONG).show()
    }


}
