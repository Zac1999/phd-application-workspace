#!/bin/bash

# Research Proposal LaTeX Compilation Script
# Usage: ./compile.sh [pdf|clean|all]

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}  RP LaTeX Compilation Script${NC}"
echo -e "${GREEN}========================================${NC}"
echo ""

# Check if pdflatex and biber are installed
if ! command -v pdflatex &> /dev/null; then
    echo -e "${RED}Error: pdflatex not found. Please install TeX Live.${NC}"
    exit 1
fi

if ! command -v biber &> /dev/null; then
    echo -e "${YELLOW}Warning: biber not found. References may not compile correctly.${NC}"
fi

# Function to compile LaTeX
compile_latex() {
    echo -e "${YELLOW}Step 1: First pdflatex pass...${NC}"
    pdflatex -interaction=nonstopmode -halt-on-error main.tex || { echo -e "${RED}First pass failed${NC}"; exit 1; }
    
    echo -e "${YELLOW}Step 2: Running biber for references...${NC}"
    biber main || echo -e "${YELLOW}Biber warning (non-fatal)${NC}"
    
    echo -e "${YELLOW}Step 3: Second pdflatex pass...${NC}"
    pdflatex -interaction=nonstopmode -halt-on-error main.tex || { echo -e "${RED}Second pass failed${NC}"; exit 1; }
    
    echo -e "${YELLOW}Step 4: Final pdflatex pass...${NC}"
    pdflatex -interaction=nonstopmode -halt-on-error main.tex || { echo -e "${RED}Final pass failed${NC}"; exit 1; }
    
    echo ""
    echo -e "${GREEN}========================================${NC}"
    echo -e "${GREEN}  Compilation Successful!${NC}"
    echo -e "${GREEN}========================================${NC}"
    echo ""
    echo -e "Output: ${GREEN}main.pdf${NC}"
    
    # Show PDF info if possible
    if command -v pdfinfo &> /dev/null; then
        echo ""
        echo "PDF Information:"
        pdfinfo main.pdf | grep -E "(Pages|File size)" || true
    fi
}

# Function to clean auxiliary files
clean_aux() {
    echo -e "${YELLOW}Cleaning auxiliary files...${NC}"
    rm -f *.aux *.bbl *.blg *.log *.out *.toc *.lof *.lot *.fls *.fdb_latexmk
    rm -f *.synctex.gz *.bcf *.run.xml
    echo -e "${GREEN}Clean complete.${NC}"
}

# Function to clean all generated files
clean_all() {
    clean_aux
    echo -e "${YELLOW}Removing PDF...${NC}"
    rm -f main.pdf
    echo -e "${GREEN}All files cleaned.${NC}"
}

# Main script logic
case "${1:-pdf}" in
    pdf)
        compile_latex
        ;;
    clean)
        clean_aux
        ;;
    cleanall|allclean)
        clean_all
        ;;
    all)
        clean_aux
        compile_latex
        ;;
    help|-h|--help)
        echo "Usage: ./compile.sh [pdf|clean|cleanall|all|help]"
        echo ""
        echo "Commands:"
        echo "  pdf       - Compile LaTeX to PDF (default)"
        echo "  clean     - Remove auxiliary files"
        echo "  cleanall  - Remove all generated files including PDF"
        echo "  all       - Clean and compile"
        echo "  help      - Show this help message"
        ;;
    *)
        echo -e "${RED}Unknown command: $1${NC}"
        echo "Use './compile.sh help' for usage information."
        exit 1
        ;;
esac
