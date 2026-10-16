\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{my_cv}[My custom CV class]
\LoadClass[paper=a4,fontsize=10pt]{article}
\RequirePackage{titlesec}
\RequirePackage{xcolor}
\RequirePackage{xhfill}
\RequirePackage{hyperref}

% No pagenumbers/headers/footers
\pagestyle{empty}

%--COLORS-----------------------------------------------------
\definecolor{lightGray}{HTML}{EFEFEF}
\definecolor{flashyGreen}{HTML}{00FF00}
\definecolor{lavenderBlue}{HTML}{C9DAF8}
\definecolor{queenPink}{HTML}{ead1dc}
\definecolor{black}{HTML}{000000}
\definecolor{white}{HTML}{ffffff}
%--COLORS----------------------------------------------------

\usepackage{xhfill}

\renewcommand{\labelitemi}{$\bullet$}

\newcommand\ruleafter[1]{#1~~\xhrulefill{black}{0.5em}} % add rule after title

\newcommand{\jobPosition}[1]{
  \Large \textbf \colorbox{flashyGreen}{#1} \xhrulefill{black}{0.5em}
}

\titleformat{\section}
  {\large\bfseries}
  {}{0em}
  {}
  []

\titleformat{\subsection}
  {\large\scshape\raggedright}
  {}{0em}
  {}

% Single left edge: no heading indent, tight vertical rhythm
\titlespacing*{\section}{0pt}{1.4em}{0.7em}
\titlespacing*{\subsection}{0pt}{1em}{0.4em}

% Bullets hug the left edge
\setlength{\leftmargini}{0.9em}
\setlength{\leftmarginii}{1.1em}
\setlength{\labelsep}{0.5em}
\def\@listi{\leftmargin\leftmargini \topsep 0.2em \parsep 0pt \itemsep 0.2em}
\def\@listii{\leftmargin\leftmarginii \labelwidth\leftmarginii \advance\labelwidth-\labelsep \topsep 0.1em \parsep 0pt \itemsep 0.1em}
\let\@listI\@listi
\@listi

\newcommand{\headerSection}[1]{\section{\texorpdfstring{#1}{}}}

\newcommand{\cvSection}[1]{\section{\texorpdfstring{\ruleafter{\badgeWithFontColor{black}{white}{#1}}}{}}}




\newcommand{\positionAndCompanyLine}[3]{%
  \subsection{\texorpdfstring{\textbf{#1} \textit{#2} \hfill {}{#3}}{}}%
}

\newcommand{\badge}[2]{%
  \colorbox{#1}{\hspace{0.1em} #2 \hspace{0.1em}}%
}

\newcommand{\badgeWithFontColor}[3]{%
  \colorbox{#1}{\hspace{0.1em} \color{#2} \textbf{#3}  \hspace{0.1em}}%
}

\newcommand{\project}[2]{%
  \par\noindent\badge{lavenderBlue}{#1} \textbf{#2}\par%
}

% \badge{queenPink}
\newcommand{\techStackList}[1]{
  \begin{flushleft}{\badge{lightGray}{Tech Stack} #1}\end{flushleft}
}

\newcommand{\educationTitleLine}[2]{
  \subsection[#1]{\textbf{#1} \hfill \badgeWithFontColor{black}{white}{#2}}
}

\newcommand{\cvParagraph}[1]{
  \begin{spacing}{1.5}
    #1
  \end{spacing}
}

% if necessary breaking the page --> https://tex.stackexchange.com/questions/94699/absolutely-definitely-preventing-page-break
\newenvironment{absolutelynopagebreak}
  {\par\nobreak\vfil\penalty0\vfilneg
   \vtop\bgroup}
  {\par\xdef\tpd{\the\prevdepth}\egroup
   \prevdepth=\tpd}