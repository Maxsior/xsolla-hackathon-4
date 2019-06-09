package com.xsolla.hackathon4

import android.os.Build
import android.support.annotation.RequiresApi
import android.support.v7.widget.RecyclerView
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.CheckBox
import android.widget.TextView

class TaskAdapter(var tasks: ArrayList<Task>) : RecyclerView.Adapter<TaskAdapter.TaskViewHolder>(){

    class TaskViewHolder(view: View) : RecyclerView.ViewHolder(view) {
        var name : TextView = view.findViewById(R.id.name)
        var done : CheckBox = view.findViewById(R.id.done)
    }

    override fun onCreateViewHolder(parent: ViewGroup, p1: Int): TaskAdapter.TaskViewHolder {
        val view = LayoutInflater.from(parent.getContext()).inflate(R.layout.goal_list_item, parent, false)
        return TaskAdapter.TaskViewHolder(view)
    }

    @RequiresApi(Build.VERSION_CODES.N)
    override fun onBindViewHolder(holder: TaskAdapter.TaskViewHolder, index: Int) {
        with(holder) {
            name.setText(tasks[index].name)
            done.isChecked = tasks[index].done !== null
        }
    }

    override fun getItemCount() = tasks.count()
}