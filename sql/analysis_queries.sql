-- =====================================================
-- 1. ABANDONO DE CLIENTES 
-- =====================================================
SELECT 
    COUNT(*) AS total_clientes,
    
    SUM(CASE 
        WHEN Churn = 'Yes' THEN 1 
        ELSE 0 
    END) AS clientes_abandonaron,

    ROUND(
        SUM(CASE 
            WHEN Churn = 'Yes' THEN 1 
            ELSE 0 
        END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM churn;

-- =====================================================
-- 2. ABANDONO POR CONTRATO
-- =====================================================

SELECT 
    Contract,
    COUNT(*) AS total_clientes,

    SUM(CASE 
        WHEN Churn = 'Yes' THEN 1 
        ELSE 0 
    END) AS clientes_abandonaron,

    ROUND(
        SUM(CASE 
            WHEN Churn = 'Yes' THEN 1 
            ELSE 0 
        END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM churn
GROUP BY Contract
ORDER BY churn_rate DESC;

-- =====================================================
-- 2. ABANDONO POR ANTIGUEDAD
-- =====================================================

SELECT 
    CASE
        WHEN tenure <= 12 THEN '0-12 meses'
        WHEN tenure <= 24 THEN '13-24 meses'
        WHEN tenure <= 48 THEN '25-48 meses'
        ELSE '49+ meses'
    END AS grupo_antiguedad,

    COUNT(*) AS total_clientes,

    SUM(CASE 
        WHEN Churn = 'Yes' THEN 1 
        ELSE 0 
    END) AS clientes_abandonaron,

    ROUND(
        SUM(CASE 
            WHEN Churn = 'Yes' THEN 1 
            ELSE 0 
        END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
    
FROM churn
GROUP BY grupo_antiguedad
ORDER BY churn_rate DESC;

-- =====================================================
-- 4. ABANDONO POR SERVICIO DE INTERNET
-- =====================================================

SELECT 
    InternetService,

    COUNT(*) AS total_clientes,

    SUM(CASE 
        WHEN Churn = 'Yes' THEN 1 
        ELSE 0 
    END) AS clientes_abandonaron,

    ROUND(
        SUM(CASE 
            WHEN Churn = 'Yes' THEN 1 
            ELSE 0 
        END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate

FROM churn
GROUP BY InternetService
ORDER BY churn_rate DESC;

-- =====================================================
-- 5. ABANDONO POR METODO DE PAGO
-- =====================================================

SELECT 
    PaymentMethod,

    COUNT(*) AS total_clientes,

    SUM(CASE 
        WHEN Churn = 'Yes' THEN 1 
        ELSE 0 
    END) AS clientes_abandonaron,

    ROUND(
        SUM(CASE 
            WHEN Churn = 'Yes' THEN 1 
            ELSE 0 
        END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate

FROM churn
GROUP BY PaymentMethod
ORDER BY churn_rate DESC;