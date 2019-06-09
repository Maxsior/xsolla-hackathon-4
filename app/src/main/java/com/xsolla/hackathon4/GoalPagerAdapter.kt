package com.xsolla.hackathon4

import android.content.Context
import android.support.v4.app.Fragment
import android.support.v4.app.FragmentManager
import android.support.v4.app.FragmentPagerAdapter

class GoalPagerAdapter(fm: FragmentManager, var context: Context) : FragmentPagerAdapter(fm) {
    var goals = Goal.loadFromJson("file.json", context)

    override fun getItem(position: Int): Fragment {
        return when (position) {
            0 -> CurrentGoalFragment(goals)
            else -> DoneGoalFragment(goals)
        }
    }

    override fun getCount() = 2

    override fun getPageTitle(position: Int): CharSequence? {
        return when (position) {
            0 -> "Текущие"
            else -> "Выполненные"
        }
    }
}