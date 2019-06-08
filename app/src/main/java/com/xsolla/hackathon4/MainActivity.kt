package com.xsolla.hackathon4

import android.os.Bundle
import android.support.v4.view.ViewPager
import android.support.v7.app.AppCompatActivity
import android.view.View
import android.widget.Toast
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {

    lateinit var viewPager: ViewPager

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val fragmentAdapter = GoalPagerAdapter(supportFragmentManager)

        viewPager = findViewById(R.id.viewPager)
        viewPager.adapter = fragmentAdapter

        tabLayout.setupWithViewPager(viewPager)

    }

    fun currentTabClicked(view: View){
        Toast.makeText(this, "current tasks", Toast.LENGTH_SHORT).show()
    }

    fun doneTabClicked(view: View){
        Toast.makeText(this, "done tasks", Toast.LENGTH_SHORT).show()
    }

    fun addGoal(view: View) {
        Toast.makeText(this, "Adding goals...", Toast.LENGTH_SHORT).show()
    }


}
