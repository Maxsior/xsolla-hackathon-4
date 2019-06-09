package com.xsolla.hackathon4

import android.os.Build
import android.support.annotation.RequiresApi
import android.support.v7.widget.RecyclerView
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.CheckBox
import android.widget.TextView
import java.time.LocalDate
import java.time.Period

class TaskAdapter(var tasks: ArrayList<Task>) : RecyclerView.Adapter<TaskAdapter.TaskViewHolder>(){

    class TaskViewHolder(view: View) : RecyclerView.ViewHolder(view) {
        var name : TextView = view.findViewById(R.id.name)
        var done : CheckBox = view.findViewById(R.id.done)
    }

    override fun onCreateViewHolder(parent: ViewGroup, p1: Int): TaskAdapter.TaskViewHolder {
        val view = LayoutInflater.from(parent.getContext()).inflate(R.layout.task_list_item, parent, false)
        return TaskViewHolder(view)
    }

    fun Period.getTotalDays() = this.years * 365 + this.months * 30 + this.days

    @RequiresApi(Build.VERSION_CODES.N)
    override fun onBindViewHolder(holder: TaskAdapter.TaskViewHolder, index: Int) {
        with(holder) {
            var period = Period.between(tasks[index].done, LocalDate.now())
            name.setText(tasks[index].name)
            done.isChecked = tasks[index].done !== null && period.getTotalDays() <= tasks[index].period && tasks[index].period != 0
        }
    }

    override fun getItemCount() = tasks.count()
}