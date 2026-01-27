package com.example.calculadoraweb;


import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Javier
 */
public class CalculatorServiceTest {
    private final CalculatorService service = new CalculatorService();
    
    @Test
    void testAdd() {
        assertEquals(9, service.add(4, 5));
    }
    
    @Test
    void testAddNegative() {
        assertEquals(-1, service.add(2, -3));
    }
}
