# 📖 Rodinná kuchařka pro Řinečku a Zaníka

Tento projekt obsahuje automatizovaný systém pro sazbu rodinné kuchařky pomocí **LaTeXu**. Cílem je vytvořit vizuálně krásnou, strukturovanou a snadno udržovatelnou sbírku receptů, které sahají od babiččiných klasik až po moderní speciality.

---

## ✨ Vlastnosti projektu

* **Profesionální sazba:** Automatické generování PDF s moderním designem (zaoblené rohy, barevné kódování receptů).
* **Sémantické psaní:** Recepty se píší pomocí jednoduchých značek (ingredience, postup), o zbytek se postará styl `recipebox.sty`.
* **Ikony a jednotky:** Integrovaná podpora pro vizuální ikonky (váha, lžíce, teplota, tekutiny).
* **Automatický obsah:** Každý nový recept se po kompilaci sám přidá do seznamu receptů s číslem stránky.
* **CI/CD Automatizace:** Při každém uložení (`git push`) se pomocí GitHub Actions vygeneruje aktuální verze PDF.

## 🚀 Jak kuchařku sestavit (Build)

### 1. Automaticky (GitHub)

Stačí pushnout změny do větve `main`. PDF verze se automaticky vytvoří a bude k dispozici v sekci **Releases** pod tagem `latest`.

### 2. Lokálně pomocí Dockeru

Pokud nechcete instalovat celý TeX Live (cca 5 GB), použijte připravený Docker skript:

```bash
chmod +x run.sh
./run.sh

```

Výsledné PDF najdete ve složce `output/`.

---

## ✍️ Jak přidat nový recept

Nové recepty přidávejte do souboru `main.tex` před příkaz `\end{document}`.

### Příklad syntaxe:

```latex
\begin{recipe}[Barva]{Název receptu}
    \begin{ingredients}
        \item \weight \textbf{500 g} \\ Hladká mouka
        \item \spoon \textbf{1 PL} \\ Cukr krystal
        \item \liquid \textbf{250 ml} \\ Vlažné mléko
    \end{ingredients}
    \begin{steps}
        \item Smíchejte suché suroviny v míse.
        \item Přidejte mléko a vypracujte vláčné těsto.
        \item Nechte kynout na teplém místě 45 minut.
    \end{steps}
\end{recipe}

```

*Dostupné ikonky: `\weight`, `\spoon`, `\tsp`, `\piece`, `\liquid`, `\temp`, `\indefinite`.*

---

## 🛠 Technické informace

* **Hlavní soubor:** `main.tex` (obsah a struktura dokumentu)
* **Styling:** `recipebox.sty` (definice vzhledu a maker)
* **Engine:** `pdflatex` (s využitím balíčků `tcolorbox`, `tabularx` a `fontawesome5`)

---

## 👨‍🍳 Seznam zkratek

* **PL** = Polévková lžíce
* **KL** = Kávová lžička

---

*Dobrou chuť přeje automatizovaný LaTeXový šéfkuchař!* 🥂
