
USE BANCA;


CREATE TABLE AnalisiSistemaBancario AS
SELECT
    cliente.id_cliente,
    TIMESTAMPDIFF(YEAR, cliente.data_nascita, CURDATE()) AS eta,
    COUNT(DISTINCT CASE WHEN tipo_transazione.desc_tipo_trans = 'Uscita' THEN transazioni.id_tipo_trans END) AS num_transazioni_uscita,
    COUNT(DISTINCT CASE WHEN tipo_transazione.desc_tipo_trans = 'Ingresso' THEN transazioni.id_tipo_trans END) AS num_transazioni_ingresso,
    SUM(CASE WHEN tipo_transazione.desc_tipo_trans = 'Uscita' THEN transazioni.importo END) AS importo_uscita,
    SUM(CASE WHEN tipo_transazione.desc_tipo_trans = 'Ingresso' THEN transazioni.importo END) AS importo_ingresso,
    COUNT(DISTINCT conto.id_conto) AS num_totale_conti,
    SUM(CASE WHEN tipo_conto.desc_tipo_conto = 'Tipo1' THEN 1 ELSE 0 END) AS num_conti_tipo1,
    SUM(CASE WHEN tipo_conto.desc_tipo_conto = 'Tipo2' THEN 1 ELSE 0 END) AS num_conti_tipo2,
    SUM(CASE WHEN tipo_conto.desc_tipo_conto = 'Tipo3' THEN 1 ELSE 0 END) AS num_conti_tipo3,
    COUNT(DISTINCT CASE WHEN tipo_transazione.desc_tipo_trans = 'Uscita' AND tipo_transazione.segno = '+' THEN transazioni.id_tipo_trans END) AS num_transazioni_uscita_tipo1,
    COUNT(DISTINCT CASE WHEN tipo_transazione.desc_tipo_trans = 'Uscita' AND tipo_transazione.segno = '-' THEN transazioni.id_tipo_trans END) AS num_transazioni_uscita_tipo2,
    COUNT(DISTINCT CASE WHEN tipo_transazione.desc_tipo_trans = 'Ingresso' AND tipo_transazione.segno = '+' THEN transazioni.id_tipo_trans END) AS num_transazioni_ingresso_tipo1,
    COUNT(DISTINCT CASE WHEN tipo_transazione.desc_tipo_trans = 'Ingresso' AND tipo_transazione.segno = '-' THEN transazioni.id_tipo_trans END) AS num_transazioni_ingresso_tipo2,
    SUM(CASE WHEN tipo_transazione.desc_tipo_trans = 'Uscita' AND tipo_transazione.segno = '+' THEN transazioni.importo END) AS importo_uscita_tipo1,
    SUM(CASE WHEN tipo_transazione.desc_tipo_trans = 'Uscita' AND tipo_transazione.segno = '-' THEN transazioni.importo END) AS importo_uscita_tipo2,
    SUM(CASE WHEN tipo_transazione.desc_tipo_trans = 'Ingresso' AND tipo_transazione.segno = '+' THEN transazioni.importo END) AS importo_ingresso_tipo1,
    SUM(CASE WHEN tipo_transazione.desc_tipo_trans = 'Ingresso' AND tipo_transazione.segno = '-' THEN transazioni.importo END) AS importo_ingresso_tipo2
FROM cliente
LEFT JOIN conto ON cliente.id_cliente = conto.id_cliente
LEFT JOIN tipo_conto ON conto.id_tipo_conto = tipo_conto.id_tipo_conto
LEFT JOIN transazioni ON conto.id_conto = transazioni.id_conto
LEFT JOIN tipo_transazione ON transazioni.id_tipo_trans = tipo_transazione.id_tipo_transazione
GROUP BY cliente.id_cliente;




