package org.example.proyectocampeonato.service;

import org.example.proyectocampeonato.excepcion.CampeonatoNotFoundException;
import org.example.proyectocampeonato.modelo.Campeonato;
import org.example.proyectocampeonato.repository.CampeonatoRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CampeonatoService {

    private final CampeonatoRepository campeonatoRepository;

    public CampeonatoService(CampeonatoRepository campeonatoRepository) {
        this.campeonatoRepository = campeonatoRepository;
    }

    public List<Campeonato> getAll() {
        return this.campeonatoRepository.findAll();
    }

    public Campeonato save(Campeonato campeonato) {
        return this.campeonatoRepository.save(campeonato);
    }

    public Campeonato one(Integer id) {
        return this.campeonatoRepository.findById(Math.toIntExact(id))
                .orElseThrow(() -> new CampeonatoNotFoundException(id));
    }

    @Transactional
    public Campeonato replace(Integer id, Campeonato campeonato) {
        return this.campeonatoRepository.findById(id)
                .map(p -> {
                    // Aseguramos que el ID del objeto que llega sea el de la URL
                    // para evitar crear un registro nuevo por error
                    campeonato.setIdCampeonato(id);
                    return this.campeonatoRepository.save(campeonato);
                })
                .orElseThrow(() -> new CampeonatoNotFoundException(id));
    }

    @Transactional
    public void delete(Integer id) {
        if (!this.campeonatoRepository.existsById(id)) {
            throw new CampeonatoNotFoundException(id);
        }
        this.campeonatoRepository.deleteById(id);
    }
}
