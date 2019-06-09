package com.xsolla.hackathon4

import android.os.Bundle
import android.support.v4.app.Fragment
import android.support.v7.widget.LinearLayoutManager
import android.support.v7.widget.RecyclerView
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import java.util.*

class CurrentGoalFragment(var goals: ArrayList<Goal>) : Fragment() {
    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        val view = inflater.inflate(R.layout.goals_tab, container, false)
        val recyclerView: RecyclerView = view.findViewById(R.id.recyclerView)
        recyclerView.layoutManager = LinearLayoutManager(view.context)

        val currentGoals = goals.filter { goal -> goal.progress < 100 } as ArrayList
        var goalAdapter = GoalAdapter(currentGoals)
        recyclerView.adapter = goalAdapter
        return view
    }
}