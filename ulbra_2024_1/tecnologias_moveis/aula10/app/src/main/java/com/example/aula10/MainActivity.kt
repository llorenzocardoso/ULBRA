package com.example.aula10

import android.os.Bundle
import android.util.Log
import android.widget.Button
import android.widget.ImageView
import androidx.activity.enableEdgeToEdge
import androidx.activity.viewModels
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat
import com.bumptech.glide.Glide

class MainActivity : AppCompatActivity() {

    private val mainViewModel : MainViewModel by viewModels()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_main)

        val listaDePessoa = mainViewModel.getListaDePessoa()

        val button = findViewById<Button>(R.id.button)

        val imageView = findViewById<ImageView>(R.id.minhaImagem)

        button.setOnClickListener {
            mainViewModel.removeDaLista()
            Log.i("Teste", "onCreate: $listaDePessoa")
        }

        Log.i("Teste", "onCreate: $listaDePessoa")

        Glide.with(this)
            .load("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCJsLKLfoI-V1WAbdYAJf7NNrO2ei208WOfw&usqp=CAU")
            .into(imageView)
    }
}