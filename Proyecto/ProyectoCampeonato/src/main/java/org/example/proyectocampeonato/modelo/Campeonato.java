package org.example.proyectocampeonato.modelo;

import jakarta.persistence.*; // Importante para las anotaciones de BD
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor; // Necesario para JPA

import java.time.LocalDate;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "campeonato")
public class Campeonato {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Autoincremental
    @Column(name = "id_campeonato") // Mapea el nombre exacto de la columna en la imagen
    private Integer idCampeonato;

    @Column(nullable = false)
    private String nombre;

    @Column(name = "fecha_inicio", nullable = false)
    private LocalDate fechaInicio;

    @Column(name = "fecha_fin", nullable = false)
    private LocalDate fechaFin;

    @Column(nullable = false)
    private String ubicacion;

    @Column(nullable = false)
    private String estado;

    // Usamos columnDefinition = "TEXT" porque las descripciones suelen ser largas
    @Column(nullable = false, columnDefinition = "TEXT")
    private String descripcion;
}