\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2026/05/14 Modern Engineering Resume Class]

\LoadClass[11pt,letterpaper]{article}

% --- Packages ---
\RequirePackage[utf8]{inputenc}
\RequirePackage[empty]{fullpage}
\RequirePackage{titlesec}
\RequirePackage[usenames,dvipsnames]{xcolor}
\RequirePackage{enumitem}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage[margin=0.5in]{geometry}
\RequirePackage{tabularx}

% --- Modern Typography (Sans-Serif) ---
\RequirePackage{helvet}
\renewcommand{\familydefault}{\sfdefault}

% --- Color Palette ---
\definecolor{accent}{RGB}{0, 128, 128}   % Sleek Tech Teal
\definecolor{darktext}{RGB}{40, 40, 40}  % Softer than pure black
\color{darktext}

% --- Section Formatting ---
% Bold, colored text with a thick rule underneath
\titleformat{\section}{
  \vspace{-4pt}\Large\bfseries\color{accent}
}{}{0em}{}[\color{accent}\titlerule \vspace{-5pt}]

% --- Modular Commands (Must match the Classic template API) ---
\newcommand{\resumeItem}[1]{
  \item\small{\color{darktext}#1 \vspace{-2pt}}
}

\newcommand{\resumeSubheading}[4]{
  \vspace{-1pt}\item
    \begin{tabular*}{0.97\textwidth}[t]{l@{\extracolsep{\fill}}r}
      \textbf{\color{accent}#1} & \textbf{\small#2} \\
      \textbf{\small#3} & \textbf{\small #4} \\
    \end{tabular*}\vspace{-5pt}
}

\newcommand{\resumeProjectHeading}[2]{
    \item
    \begin{tabular*}{0.97\textwidth}{l@{\extracolsep{\fill}}r}
      \textbf{\color{accent}#1} & \textbf{\small#2} \\
    \end{tabular*}\vspace{-7pt}
}

\newcommand{\resumeSubItem}[2]{\resumeItem{\textbf{#1}}{#2}\vspace{-4pt}}

\renewcommand{\labelitemii}{$\circ$}

% --- List Environments ---
\newcommand{\resumeSubHeadingListStart}{\begin{itemize}[leftmargin=0.15in, label={}]}
\newcommand{\resumeSubHeadingListEnd}{\end{itemize}}
\newcommand{\resumeItemListStart}{\begin{itemize}}
\newcommand{\resumeItemListEnd}{\end{itemize}\vspace{-5pt}}
