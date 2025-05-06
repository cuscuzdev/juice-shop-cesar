#!/bin/bash
set -e
echo "[*] Rodando npm audit..."
npm install --package-lock-only > /dev/null 2>&1
npm audit --audit-level=high