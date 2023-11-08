package com.udc.fic.services;

import com.udc.fic.model.Trabajador;
import com.udc.fic.repository.DisponibilidadRepository;
import com.udc.fic.repository.TrabajadorRepository;
import com.udc.fic.services.exceptions.DuplicateInstanceException;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import javax.management.InstanceNotFoundException;
import java.time.LocalDate;
import java.util.Optional;
import java.util.logging.Logger;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class TrabajadorTest {


    @InjectMocks
    TrabajadorServiceImpl trabajadorService;

    @Mock
    TrabajadorRepository trabajadorRepository;

    @Mock
    Logger logger;


    @Mock
    DisponibilidadRepository disponibilidadRepository;


    @Test
    void obtenerTrabajadorTest() throws InstanceNotFoundException {
        LocalDate birthdate = LocalDate.now();
        Trabajador trabajador = new Trabajador(1L, "test", "test", "12345678Q", "123456789012", "666666666", birthdate, "address", null);

        Optional<Trabajador> res = Optional.of(trabajador);
        when(trabajadorRepository.findById(1L)).thenReturn(res);

        assertEquals("12345678Q", trabajadorService.obtenerTrabajador(1L).getDni());
    }

    @Test
    void obtenerTrabajadorNotFoundTest() throws InstanceNotFoundException {
        LocalDate birthdate = LocalDate.now();
        Trabajador trabajador = null;

        Optional<Trabajador> res = Optional.empty();
        when(trabajadorRepository.findById(1L)).thenReturn(res);

        assertThrows(InstanceNotFoundException.class, () -> trabajadorService.obtenerTrabajador(1L));
    }

    @Test
    void registrarTrabajadorTest() throws DuplicateInstanceException {
        LocalDate birthdate = LocalDate.now();
        Trabajador trabajador = new Trabajador(1L, "test", "test", "12345678Q", "123456789012", "666666666", birthdate, "address", null);
        when(trabajadorRepository.existsByDniOrNss(trabajador.getDni(), trabajador.getNss())).thenReturn(false);
        when(trabajadorRepository.save(trabajador)).thenReturn(trabajador);
        assertEquals("12345678Q", trabajadorService.registrarTrabajador(trabajador).getDni());
    }

    @Test
    void registrarTrabajadorDuplicateExceptionTest() {
        LocalDate birthdate = LocalDate.now();
        Trabajador trabajador = new Trabajador(1L, "test", "test", "12345678Q", "123456789012", "666666666", birthdate, "address", null);
        when(trabajadorRepository.existsByDniOrNss(trabajador.getDni(), trabajador.getNss())).thenReturn(true);

        assertThrows(DuplicateInstanceException.class, () -> trabajadorService.registrarTrabajador(trabajador));

    }


}
