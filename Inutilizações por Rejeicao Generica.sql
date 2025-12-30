SELECT
    COUNT(*) QTD_INUT,
    TRIM(
        REGEXP_REPLACE(
            REPLACE(REPLACE(JUSTIFICATIVA, 'ç', 'c'), 'ã', 'a'),
            '\s*\[nItem:[0-9]+\]',
            ''
        )
    ) AS REJEICAO_GENERICA
FROM MONITORPDV.TB_DOCTOINUTNFE
WHERE CODRETORNO = 102
  AND DTAHORINUTILIZACAO BETWEEN DATE '2025-01-01' AND SYSDATE
GROUP BY
    TRIM(
        REGEXP_REPLACE(
            REPLACE(REPLACE(JUSTIFICATIVA, 'ç', 'c'), 'ã', 'a'),
            '\s*\[nItem:[0-9]+\]',
            ''
        )
    )
ORDER BY QTD_INUT DESC;
