package com.xsolla.hackathon4

import android.support.v4.app.Fragment
import android.support.v4.app.FragmentManager
import android.support.v4.app.FragmentPagerAdapter

class GoalPagerAdapter(fm: FragmentManager) : FragmentPagerAdapter(fm) {
    override fun getItem(position: Int): Fragment {
        return when (position) {
            0 -> CurrentGoalFragment()
            else -> DoneGoalFragment()
        }
    }

    override fun getCount() : Int {
        return 2
    }

    override fun getPageTitle(position: Int): CharSequence? {
        return when (position) {
            0 -> "Текущие"
            else -> "Выполненные"
        }
    }
}