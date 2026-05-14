# Použijeme stabilní distribuci s TeX Live
FROM debian:bookworm-slim

# Instalace LaTeXu a potřebných nástrojů
RUN apt-get update && apt-get install -y \
    texlive-latex-extra \
    texlive-fonts-extra \
    texlive-lang-czechslovak \
    texlive-xetex \
    texlive-bibtex-extra \
    latexmk \
    && rm -rf /var/lib/apt/lists/*

# Nastavení pracovního adresáře
WORKDIR /data

# Vytvoříme pomocný skript pro kompilaci
RUN echo '#!/bin/bash\n\
mkdir -p build output\n\
# Kompilujeme 2x kvůli obsahu, pomocné soubory jdou do build/\n\
pdflatex -output-directory=build main.tex\n\
pdflatex -output-directory=build main.tex\n\
# Přesuneme finální PDF do output/\n\
cp build/main.pdf output/kucharka.pdf' > /compile.sh && chmod +x /compile.sh

CMD ["/compile.sh"]
