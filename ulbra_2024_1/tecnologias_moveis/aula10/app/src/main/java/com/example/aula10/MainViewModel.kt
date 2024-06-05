package com.example.aula10

import androidx.lifecycle.ViewModel

class MainViewModel : ViewModel() {

    private val listaDePessoa = mutableListOf("Daniel", "Maria", "Joao")

    fun getListaDePessoa() = listaDePessoa

    fun removeDaLista () = listaDePessoa.removeAt(0)

}