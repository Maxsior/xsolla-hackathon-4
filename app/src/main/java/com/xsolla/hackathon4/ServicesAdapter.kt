package com.xsolla.hackathon4

import android.os.Build
import android.support.annotation.RequiresApi
import android.support.v7.widget.RecyclerView
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.TextView

class ServicesAdapter(var services: ArrayList<String>) : RecyclerView.Adapter<ServicesAdapter.ServiceViewHolder>(){

    class ServiceViewHolder(view: View) : RecyclerView.ViewHolder(view) {
        var name : TextView = view.findViewById(R.id.name)
        var image : ImageView = view.findViewById(R.id.image)
    }

    override fun onCreateViewHolder(parent: ViewGroup, p1: Int): ServicesAdapter.ServiceViewHolder {
        val view = LayoutInflater.from(parent.getContext()).inflate(R.layout.service_list_item, parent, false)
        return ServiceViewHolder(view)
    }

    @RequiresApi(Build.VERSION_CODES.N)
    override fun onBindViewHolder(holder: ServicesAdapter.ServiceViewHolder, index: Int) {
        with(holder) {
            val uri = services[index]
            name.setText(uri)
            image.setImageResource(R.drawable.ic_home_black_24dp)
        }
    }

    override fun getItemCount() = services.count()
}