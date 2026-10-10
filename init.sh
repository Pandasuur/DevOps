#!/bin/bash

# 1. Verificar si el usuario ingresó al menos una dependencia
if [ $# -eq 0 ]; then
    echo "❌ Error: Debes especificar al menos una dependencia."
    echo "Uso: $0 <dep1> <dep2> <dep3> ..."
    echo "Ejemplo: $0 python3 git curl"
    exit 1
fi

echo "🔍 Iniciando verificación de dependencias..."
echo "----------------------------------------"

# Contador de errores
FALLAS=0

# 2. Recorrer todos los argumentos pasados al script
for DEP in "$@"; do
    printf "Verificando %-15s " "[$DEP]..."
    
    if command -v "$DEP" &> /dev/null; then
        echo "✅ INSTALADO"
    else
        echo "❌ NO ENCONTRADO"
        FALLAS=$((FALLAS + 1))
    fi
done

echo "----------------------------------------"

# 3. Reporte final y estado de salida
if [ $FALLAS -eq 0 ]; then
    echo "🎉 ¡Excelente! Todas las dependencias están listas."
    exit 0
else
    echo "⚠️  Atención: Faltan $FALLAS dependencia(s) en el sistema."
    exit 1
fi
