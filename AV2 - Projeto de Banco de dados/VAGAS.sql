-- Vagas disponiveis. Dia de consulta = '2025-07-10'
SELECT v.*
FROM VAGAS v
WHERE v.disponivel = TRUE
  AND v.id NOT IN (
    SELECT rv.id_vaga
    FROM RESERVA_VAGAS rv
    JOIN RESERVAS r ON r.id = rv.id_reserva
    WHERE '2025-07-10' BETWEEN r.data_inicio AND r.data_fim
      AND r.status IN ('Pendente', 'Confirmada')
  );

-- Vagas reservadas. Dia de consulta = '2025-07-10'
SELECT v.*
FROM VAGAS v
JOIN RESERVA_VAGAS rv ON rv.id_vaga = v.id
JOIN RESERVAS r ON r.id = rv.id_reserva
WHERE '2025-07-10' BETWEEN r.data_inicio AND r.data_fim
  AND r.status IN ('Pendente', 'Confirmada');
