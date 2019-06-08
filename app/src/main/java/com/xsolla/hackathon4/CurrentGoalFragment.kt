package com.xsolla.hackathon4

import android.os.Bundle
import android.support.v4.app.Fragment
import android.support.v7.widget.LinearLayoutManager
import android.support.v7.widget.RecyclerView
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import java.util.*

class CurrentGoalFragment : Fragment() {
    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        val view = inflater.inflate(R.layout.goals_tab, container, false)
        val recyclerView: RecyclerView = view.findViewById(R.id.recyclerView)
        recyclerView.layoutManager = LinearLayoutManager(view.context)

        var goals = ArrayList<Goal>()
        goals.add(
            Goal(
                "name",
                Date(198129124),
                "Хочу занять на хакатоне от Xsolla %d место",
                ArrayList<String>(),
                ArrayList<Task>(),
                "No",
                ArrayList<String>()
            )
        )
        goals.add(
            Goal(
                "name2",
                Date(198129124),
                "Хочу занять на хакатоне от Xsolla %d место",
                ArrayList<String>(),
                ArrayList<Task>(),
                "No",
                ArrayList<String>()
            )
        )
        goals.add(
            Goal(
                "name3",
                Date(198129124),
                "Хочу занять на хакатоне от Xsolla %d место",
                ArrayList<String>(),
                ArrayList<Task>(),
                "No",
                ArrayList<String>()
            )
        )

        var goalAdapter = GoalAdapter(goals)
        recyclerView.adapter = goalAdapter
        return view
    }
}