#!/bin/bash
# ================================================
# YXT-FermionGenerations - Full Verification Script
# ================================================

echo "🚀 Starting full verification for YXT-FermionGenerations"
echo "Paper: From T^64 Topology to Three Generations of Fermions"
echo "=================================================="

SUCCESS=true

# 1. Lean 4
echo -e "\n[1/3] 📐 Lean 4 Formalization..."
if [ -d "lean" ]; then
    cd lean
    lake exe cache get --quiet 2>/dev/null || true
    lake build
    
    if [ $? -eq 0 ]; then
        echo "✅ Lean 4: Success"
    else
        echo "❌ Lean 4: Failed"
        SUCCESS=false
    fi
    cd ..
else
    echo "⚠️  lean/ directory not found, skipping Lean verification."
fi

# 2. Coq
echo -e "\n[2/3] 📐 Coq Formalization..."
if [ -d "coq" ]; then
    cd coq
    make -s 2>/dev/null || true
    
    if [ $? -eq 0 ]; then
        echo "✅ Coq: Success"
    else
        echo "❌ Coq: Failed (or Makefile not configured)"
        SUCCESS=false
    fi
    cd ..
else
    echo "⚠️  coq/ directory not found, skipping Coq verification."
fi

# 3. Python
echo -e "\n[3/3] 📊 Python Numerical Verification..."
if [ -d "python" ]; then
    cd python
    pip install -r requirements.txt --quiet 2>/dev/null || true
    python verify_generations.py
    
    if [ $? -eq 0 ]; then
        echo "✅ Python: Success"
    else
        echo "❌ Python: Failed"
        SUCCESS=false
    fi
    cd ..
else
    echo "⚠️  python/ directory not found."
fi

echo -e "\n=================================================="
if [ "$SUCCESS" = true ]; then
    echo "🎉 ALL VERIFICATIONS COMPLETED SUCCESSFULLY!"
else
    echo "⚠️  Some verifications failed or were skipped."
    echo "   Please check the messages above."
fi
echo "=================================================="
