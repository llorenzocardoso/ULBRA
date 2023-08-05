package com.example.alunos.controller;

import com.example.alunos.model.aluno;
import com.example.alunos.repository.AlunoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api")
public class AlunoController {

    @Autowired
    AlunoRepository alunoRepository;
    @GetMapping("/alunos")
    public List<aluno> getAllAlunos(){
        return alunoRepository.findAll();
    }

    @GetMapping("/alunos/{id}")
    public Optional<aluno> getById(@PathVariable(value = "id") Long id){
        return alunoRepository.findById(id);
    }

    @DeleteMapping("/alunos/{id}")
    public ResponseEntity<?> deleteAluno(@PathVariable(value = "id")Long id){
        Optional<aluno> aluno = alunoRepository.findById(id);
        alunoRepository.delete(aluno.get());
        return ResponseEntity.ok().build();
    }

    @PutMapping("/alunos/{id}")
    public aluno updateAluno(@PathVariable(value = "id")Long id,
                            @Valid @RequestBody aluno alunoDetails){
        Optional<aluno> aluno = alunoRepository.findById(id);
        aluno.get().setNome(alunoDetails.getNome());
        aluno.get().setTurma(alunoDetails.getTurma());
        aluno alunoResponse = alunoRepository.save(aluno.get());
        return alunoResponse;
    }

    @PostMapping("/alunos")
    public aluno createAluno(@Valid @RequestBody aluno aluno){
        return alunoRepository.save(aluno);
    }
}
