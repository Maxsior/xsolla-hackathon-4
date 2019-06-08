package com.xsolla.hackathon4

import android.graphics.Color
import android.os.Build
import android.support.annotation.RequiresApi
import android.support.v7.widget.RecyclerView
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView

class GoalAdapter(var goals: ArrayList<Goal>) : RecyclerView.Adapter<GoalAdapter.GoalViewHolder>(){

    class GoalViewHolder(view: View) : RecyclerView.ViewHolder(view) {
        var progressBar : CircularProgressBar = view.findViewById(R.id.goalprogress)
        init {
            progressBar.setProgressWidth(10)
            progressBar.setProgressColor( Color.parseColor("#D81B60") )//R.color.colorAccent)
        }
        var name : TextView = view.findViewById(R.id.name)
        var deadline : TextView = view.findViewById(R.id.deadline)
    }

    override fun onCreateViewHolder(parent: ViewGroup, p1: Int): GoalViewHolder {
        val view = LayoutInflater.from(parent.getContext()).inflate(R.layout.goal_list_item, parent, false)
        return GoalViewHolder(view)
    }

    @RequiresApi(Build.VERSION_CODES.N)
    override fun onBindViewHolder(holder: GoalViewHolder, index: Int) {
        with(holder) {
            name.setText(goals[index].name)
            deadline.setText(goals[index].deadline.toString())
            progressBar.setProgress(50)
        }
    }

    override fun getItemCount(): Int {
        return goals.count()
    }
}