package com.xsolla.hackathon4

import android.content.Context
import org.json.JSONArray
import java.io.File
import java.time.LocalDate
import java.util.*
import kotlin.collections.ArrayList

class Goal (
    val name: String,
    val deadline: LocalDate,
    val template: String,
    val vars: ArrayList<String>,
    val tasks: ArrayList<Task>,
    val motivation: String,
    val services: ArrayList<String>,
    val progress: Int
) {
    companion object {
        fun loadFromJson(filename: String, context: Context) : ArrayList<Goal> {

            val file = File(context.filesDir,"file.json")

            var json_s = if(file.exists()) file.readText(Charsets.UTF_8) else "[]"
            val json_arr = JSONArray(json_s)

            var goals = ArrayList<Goal>()

            for (i in 0..json_arr.length()-1) {
                with(json_arr.getJSONObject(i)) {
                    val name = getString("name")
                    val deadline = LocalDate.parse(getString("deadline").slice(0..9))
                    val template = getString("template")
                    var vars = ArrayList<String>()
                    val vars_t = getJSONArray("vars")
                    for (j in 0..vars_t.length()-1) {
                        vars.add(vars_t.getString(j))
                    }
                    var tasks = ArrayList<Task>()
                    val tasks_t = getJSONArray("tasks")
                    for (j in 0..tasks_t.length()-1) {
                        with(tasks_t.getJSONObject(j)) {
                            val name = getString("name")
                            val done = LocalDate.parse(getString("done").slice(0..9))
                            val period = getInt("period")
                            tasks.add(Task(name, done, period))
                        }
                    }
                    val motivation = getString("motivation")
                    val services = ArrayList<String>()
                    val services_t = getJSONArray("services")
                    for (j in 0..services_t.length()-1) {
                        services.add(services_t.getString(j))
                    }
                    val progress = getInt("progress")
                    goals.add(Goal(name, deadline, template, vars, tasks, motivation, services, progress))
                }
            }

            return goals

        }
    }
}