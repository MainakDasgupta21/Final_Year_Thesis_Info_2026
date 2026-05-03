% NITA style for B.Tech, M.Tech and Ph.D Thesis Project Report
% -- morphed from the stanford style with numerous localizations!


%----------------------------- identification ---------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nitathesis}[2012/08/01 v1.0 NITA B.Tech , M. Tech, MCA , PhD  thesis report]
%----------------------------- initial code -----------------------------------

%--------------------------- declaration of options ---------------------------
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
%--------------------------- execution of options -----------------------------
\ProcessOptions
%--------------------------- package loading ----------------------------------
\LoadClass[12pt,a4paper,twoside]{report}

%-------------------------------- main code -----------------------------------
\renewcommand{\bibname}{References}

% \RequirePackage[usenames, dvipsnames]{xcolor}
\RequirePackage{amssymb}
% \RequirePackage{graphics}
% \RequirePackage{graphicx}
\RequirePackage{fancyhdr}
%\RequirePackage{eucal}
%\RequirePackage[USenglish]{babel}

%\RequirePackage[perpage]{footmisc}
%\RequirePackage[square, sort, numbers, authoryear]{natbib}
% \RequirePackage{ifthen}
\RequirePackage{blindtext}





\long\def\comment#1{}
\comment{
\usepackage[ pdftex,
            pdfpagelayout = None, %useoutlines,
            %bookmarks,
            %bookmarksopen = true,
            pdfstartview = FitH, %other options: Fit, FitB
            bookmarksnumbered = true,
            breaklinks = true,
            linktocpage,
            backref,
            colorlinks = true,
            linkcolor = blue,
            urlcolor  = blue,
            citecolor = blue,
            anchorcolor = blue,
            hyperindex = false,
            hyperfigures,
            a4paper,
            longtable,
            pdfpagemode = None,
            pdfauthor = {Anupamjamatia},
            pdftitle = {UG Thesis-2020},
            ]{hyperref}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Page layout
%--------------

% We need 1" margins except on the binding edge, where it is 1 1/2"
% Theses are single-sided, so we don't care about \evensidemargin
%\oddsidemargin 2.5cm \evensidemargin 3.8cm % + 1inch= 3cm
\oddsidemargin 0.46cm \evensidemargin 0.46cm % + 1inch= 3cm
\marginparwidth 40pt \marginparsep 10pt
\topmargin 0pt \headsep 30pt
\textheight 22.5cm \textwidth 16cm
%\footheight 0cm
%\headheight 0cm


% Disallow page breaks at hyphens (this will give some underfull vbox's,
% so an alternative is to use \brokenpenalty=100 and manually search
% for and fix such page breaks)
\brokenpenalty=10000







%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Use 1.3 times the normal baseline-to-baseline skip
\renewcommand{\baselinestretch}{1.3}

% Figures and tables are to be numbered sequentially throughout the
% thesis, rather than within chapters; for style consistency, do
% equations the same.  The following \def of \cl@chapter is a kludge:
% really there should be a \removefromreset, to stop figure numbers,
% etc., from being reset at chapter beginnings

\def\cl@chapter{\@elt{section}\@elt{footnote}}
\def\thefigure{\@arabic\c@figure}
\def\thetable{\@arabic\c@table}
\def\theequation{\arabic{equation}}

% Redefine the macro used for floats (including figures and tables)
% so that single spacing is used. (Note \def\figure{\@float{figure}set
% single spacing} doesn't work because figure has an optional
% argument)
\def\@xfloat#1[#2]{\ifhmode \@bsphack\@floatpenalty -\@Mii\else
   \@floatpenalty-\@Miii\fi\def\@captype{#1}\ifinner
\@parmoderr\@floatpenalty\z@
\else\@next\@currbox\@freelist{\@tempcnta\csname ftype@#1\endcsname
\multiply\@tempcnta\@xxxii\advance\@tempcnta\sixt@@n \@tfor \@tempa
:=#2\do {\if\@tempa h\advance\@tempcnta \@ne\fi \if\@tempa
t\advance\@tempcnta \tw@\fi \if\@tempa b\advance\@tempcnta
4\relax\fi \if\@tempa p\advance\@tempcnta 8\relax\fi
}\global\count\@currbox\@tempcnta}\@fltovf\fi
\global\setbox\@currbox\vbox\bgroup
\def\baselinestretch{1}\@normalsize \boxmaxdepth\z@
\hsize\columnwidth \@parboxrestore}

% Redefine the macro used for footnotes to use single spacing
\long\def\@footnotetext#1{\insert\footins{\def\baselinestretch{1}\footnotesize
    \interlinepenalty\interfootnotelinepenalty 
    \splittopskip\footnotesep
    \splitmaxdepth \dp\strutbox \floatingpenalty \@MM
    \hsize\columnwidth \@parboxrestore
   \edef\@currentlabel{\csname p@footnote\endcsname\@thefnmark}\@makefntext
    {\rule{\z@}{\footnotesep}\ignorespaces
      #1\strut}}}

% \author, \title are defined in report; here are the rest of the
% front matter defining macros


\def\dept#1{\gdef\@dept{#1}}
\def\supervisor#1{\gdef\@supervisor{#1}}
\def\hod#1{\gdef\@hod{#1}}
\def\externalexaminer#1{\gdef\@externalexaminer{#1}}
\def\degree#1{\mox{\gdef\@degree{#1}}}
\def\submitdate#1{\gdef\@submitdate{#1}}
\def\copyrightyear#1{\gdef\@copyrightyear{#1}} % \author, \title in report
\def\specialization#1{\mbox{\gdef\@specialization{#1}}}
\def\@maintitle{Digital Horizon Connectors}
\def\@title{Digital Horizon Connectors}
\def\@author{Mainak Dasgupta (22UCS006)}
\def\@RegNo{22UCS006} % Like 11PCS001
\def\@dept{Computer Science and Engineering}
\def\@extdept{NIT Agartala}
\def\@supervisor{Dr. Awnish Kumar}
\def\@extsupervisor{Ext. Dr. Awnish Kumar}
\def\@hod{Prof. Mrinal Kanti Debbarma}
\def\@externalexaminer{Signature with Seal}
\def\@degree{Bachelor of Technology}
  \def\@specialization{Computer Science \& Engineering}
\def\@college{~National Institute of Technology, Agartala}
\def\@extcollege{NIT Agartala} 

\def\@submitdate{\ifcase\the\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space \number\the\year}
  
\def\@submitdatewc{\ifcase\the\month\or
  January\or February\or March\or APRIL\or MAY\or JUNE\or
  July\or August\or September\or October\or November\or December\fi,
  \space \number\the\year}
%\ifnum\month=12
%    \@tempcnta=\year \advance\@tempcnta by 1
%    \edef\@copyrightyear{\number\the\@tempcnta}
%\else
    \def\@copyrightyear{\number\the\year}
%\fi
%
\newif\ifcopyright \newif\iffigurespage \newif\iftablespage
\copyrightfalse

% Some template variants call these hooks without defining them.
% Provide safe defaults so compilation does not fail.
\providecommand{\internapprovalsheet}{}
\providecommand{\signaturepage}{}
\def\viveksignatureimage#1{\gdef\@viveksignatureimage{#1}}
\def\@viveksignatureimage{images/vivek_signature_clean.png}
\newcommand{\renderVivekSignature}{%
  \IfFileExists{\@viveksignatureimage}{%
    \vspace*{0.2cm}
    \centerline{\includegraphics[width=0.30\textwidth]{\@viveksignatureimage}}
    \vspace*{0.2cm}
  }{}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\coverp{%
    \thispagestyle{empty}%
    \renewcommand{\baselinestretch}{1}
    \null%
    \begin{center}
        \textbf{{\Large \uppercase \expandafter{\@maintitle}}}
    \end{center}
  \vskip 3cm 
  
  \begin{center}
    \begin{figure} [htb]
    \begin{center}
    \includegraphics[scale=0.4]{images/nita_logo1.png}
    \end{center}
    \end{figure}
  \end{center}
  \vskip 2cm   
    \begin{center}

        \textbf{\textit{Mainak Dasgupta (22UCS006) 
        }}\\
    	%\@RegNo
    \end{center}
    
    \begin{center}

        {\bf \expandafter{COMPUTER SCIENCE \& ENGINEERING DEPARTMENT}}\\
        { \bf {NATIONAL INSTITUTE OF TECHNOLOGY, AGARTALA\\INDIA-799046}}\\
        \bf {\@submitdatewc}
    \end{center}

    \vskip 1cm
\newpage}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\titlep{%
    \thispagestyle{empty}%
    \renewcommand{\baselinestretch}{1}
    \null%
    \begin{center}
        \textbf{{\Large \uppercase \expandafter{\@maintitle}}}
    \end{center}
  
    \begin{center}
%        {\sl A Thesis Submitted}\\
        \textbf {\textit{Report submitted to\\
        \@college\\        
        for the award of the degree\\
        of\\
        \large \@degree}}\\
        
    \end{center}
    \begin{center}
%        \sl by\\
        \textbf {\textit{by\\
         \large {Mainak Dasgupta (22UCS006) 
         }}}
    \end{center}
\begin{center}
%        \sl by\\
       \textbf{ \textit{Under the Guidance of\\
       \vskip .1cm
        Mr. Vivek Rodge\\
    Software Development Manager, Amdocs\\
    \vskip .3cm
    and\\
    \vskip .3cm
    Dr. Awnish Kumar\\
    Department Supervisor\\
    Assistant Professor\\
    CSE Department, NIT Agartala
    }} % designation of supervisor
    
    \end{center}
    % \vskip 0.7cm 

\vspace*{-0.4cm} % Optional space before the logo (tweak as needed)
\noindent

    \begin{center}

    \includegraphics[scale=0.50]{images/nita_logo.png}

    \end{center}

\vspace*{-0.4cm} % Optional space before the logo (tweak as needed)
% \vspace{0.2cm}
    \begin{center}
%        {\sl to the}\\
        
        {\bf \expandafter \large \uppercase {{Computer Science \& Engineering Department}}}\\
        {\bf \large \uppercase {National Institute of Technology Agartala}}\\
        \bf \large {\@submitdatewc}
       
    \end{center}
    % \vskip 0.05cm
    
    \begin{center}

    \end{center}

    % \vskip 0.5cm
    
\newpage}

\def\copyrightpage{%
    \null\vfill
    \begin{center}
        \Large\copyright\ Copyright \@copyrightyear\\
        by\\
        \@author\\
    \end{center}
    \vfill\newpage}

    
\def\undertakingpage{\newpage%
    \renewcommand{\baselinestretch}{1.3}
    \vspace*{\fill}
    \centerline{\LARGE\bf UNDERTAKING}
    \vspace{3cm}
    \begin{center}
    \begin{minipage}{5.5in}
    \parindent=0pt
    I declare that the work presented in this project proposal titled
    ``{\sl\textbf{\@title}}'', submitted to the \mbox{\@dept} Department,\@college, for 
    the award of the {\bf\emph \@degree} degree in \mbox{\bf\emph \@specialization}, 
    is my original work. I have not plagiarized or submitted the same work for 
    the award of any other degree. In case this undertaking is found incorrect, I accept 
    that my degree may be unconditionally withdrawn.\par
    \vspace*{2cm}
    \@submitdatewc\\Agartala\par
    \hbox to 4.5in {
    \hfill\vbox{\hsize 2in\vrule width 2in height0.4pt\vspace*{-4mm}\par\center{\@author}}}


    \vspace*{5cm}
    \end{minipage}
    \end{center}
}


%%%%%%%%%%%%%%%%%%Declaration Page%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


    
\def\declaration{\newpage%
    \renewcommand{\baselinestretch}{1.3}
%    \vspace*{\fill}
    \centerline{\LARGE\bf DECLARATION}
    \vspace{2cm}
    \begin{center}
    \begin{minipage}{5.5in}
    \parindent=0pt
    
    I declare that the work presented in this report titled ``{\sl\textbf{\@title}}'', submitted to the \textbf{Computer Science and Engineering Department, NIT Agartala}, for the award of the {\bf\emph \@degree} degree in \mbox{\bf\emph \@specialization}, represents my ideas in my own words and where others' ideas or words have been included, I have adequately cited and referenced the original sources. I also declare that I have adhered to all principles of academic honesty and integrity and have not misrepresented or fabricated or falsified any idea/data/fact/source in my submission. I understand that any violation of the above will be a cause for disciplinary action by the Institute and can also evoke penal action from the sources which have thus not been properly cited or from whom proper permission has not been taken when needed.\par
    \vspace*{1cm}
    \@submitdatewc\\Agartala\par
%    \hbox to 5.5in {
%    \hfill\vbox{\hsize 2in\vrule width 2in
%    height0.4pt\vspace*{-4mm}\par\center{Candidates name}}}
      


\vspace*{1.5cm}
\hbox to 0.1in {
    \hfill\vbox{\hsize 2in\vrule width 2in height0.4pt\vspace*{-4mm}\par\center{Mainak Dasgupta (22UCS006)}}}
   

    \vspace*{5cm}
    \end{minipage}
    \end{center}
}

%55555555555555555555555555555
\long\def\approvalsheetpreabmle{%
\parindent=0pt
This report entitled ``{\sl\textbf{\@title}}'', by \textbf{Mainak Dasgupta (22UCS006)}  is approved in partial fulfilment of the requirements for the award of \textit{\textbf{Bachelor of Technology}} in \textit{\textbf{Computer Science \&  Engineering.}} \par
%\mbox{\bf\emph \@degree} in \mbox{\bf\emph \@specialization}.\par
\vspace{3cm}}

\long\def\signature#1{%
\parbox{0.47\textwidth}{\hrulefill\par#1}
}

\def\approvalsheet{%
    \renewcommand{\baselinestretch}{1.3}

%\vspace*{\fill}
    \centerline{\LARGE\bf REPORT APPROVAL FOR B.TECH}
    \vspace{2cm}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\signaturepreabmle
\approvalsheetpreabmle
    \signature{
        \centerline{\small Prof. Mrinal Kanti Debbarma }\par 
	\centerline{\small (Head~of~the~Department)}\par
	\centerline{\small Professor}\par 
         \centerline{\small \@dept \ Department}\par
       \centerline{\small NIT Agartala}\par
	}\hfill
    \signature{
	\centerline{\small Dr. Awnish Kumar }\par 
	\centerline{\small (Department Supervisor)}\par
	\centerline{\small Assistant Professor}\par 
         \centerline{\small \@dept \ Department}\par
       \centerline{\small NIT Agartala}\par
	}\hfill
	%\end{center}
\vspace{2cm}
\begin{center}
   \signature{
        \renderVivekSignature
        \centerline{\small Mr. Vivek Rodge}\par
	\centerline{\small (Project Manager)}\par
        \centerline{\small Software Development Manager}\par
        \centerline{\small Amdocs}}
\end{center}

    \vspace{2cm}
    \mbox{
        \leftline{Date:\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_}
        }
    \mbox{    
        \leftline{Place: NIT, Agartala}
        }\hfill
    
    \vspace*{\fill}
    \vfill\newpage
}



% 55555555555555555555555555555
\long\def\internshipsignaturepreabmle{%
\parindent=0pt
It is certified that the work contained in the dissertation titled `{\sl\textbf{\@title}}'', by \textbf{Mainak Dasgupta (22UCS006)} have been carried out under our supervision. This work has not been submitted elsewhere for a degree.
\par
\vspace{2cm}}



\long\def\Iinternshipsignaturepreabmle{%
\parindent=0pt
\vspace{1cm}
The dissertation titled ``{\sl\textbf{\@title}}'', by \textbf{Mainak Dasgupta} bearing the Enrollment Number \textbf{22UCS006} is respectively endorsed for submission for the  \textbf{Bachelor of Technology} in \textbf{Computer Science \&  Engineering Department, NIT Agartala}.
\par

\vspace{2cm}}


% \long\def\signature#1{%
% \parbox{0.47\textwidth}{\hrulefill\par#1}
% }


\def\internshipsignaturepage{%
    \renewcommand{\baselinestretch}{1.3}




\vspace*{\fill}
    \centerline{\LARGE\bf CERTIFICATE}
    \vspace{2cm}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\internshipsignaturepreabmle
\begin{center}
        \signature{
        \renderVivekSignature
	\centerline{\small Mr. Vivek Rodge}\par
	\centerline{\small (Project Manager)}\par
	\centerline{\small Software Development Manager}\par 
         \centerline{\small Amdocs}\par
	}
\end{center}
    \vspace*{\fill}

\Iinternshipsignaturepreabmle
     \null\hfill 
    \signature{
	\centerline{\@supervisor}\par
        \centerline{Assistant Professor}\par
        \centerline{(Department Supervisor)}
	\centerline{\@dept \ Department}\par
 \centerline{\@extdept}\par 
        %\@dept \ Dept.\par
        % abcd University
	}\hfill
    \vspace*{\fill}



    \vspace*{\fill}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%5555555555555555555555555555

\def\beforepreface{
    \pagenumbering{roman}
    \pagestyle{plain}
    \coverp
    %\clearpage\mbox{}\clearpage
    \titlep
    \ifcopyright\copyrightpage\fi
    %\prefacesection{Dedicated To}
    \renewcommand{\baselinestretch}{1.3}
    \centerline{\LARGE\bf Dedicated To}
    \vspace{2cm}
    \begin{center}
    \begin{minipage}{5.5in}
    \parindent=0pt
%%%%%%%%%%%%%%%%%%%%%%%%%
%% Put the content of this section 
This report is dedicated to \textbf{Prof. Mrinal Kanti Debbarma}, HOD, CSE Department, NIT Agartala, my Project Manager \textbf{Mr. Vivek Rodge}, Software Development Manager, Amdocs and my Project Supervisor \textbf{Dr. Awnish Kumar}, Assistant Professor, CSE Department, NIT Agartala for sharing their valuable knowledge and encouragement and showing confidence on me all the time, to each of the faculties of the department who contributed to my development as a professional and helped me to achieve this goal, to my parents who supported me and believed in me and to all those people who have somehow contributed to the creation of this project.


%%%%%%%%%%%%%%%%%%%%%%%
     
  
\end{minipage}
\end{center}

\newpage
\vspace*{6cm}
\begin{center}
\textit{\textbf { \begin{large} \ding{125}First, solve the problem. Then, write the code.\ding{126}\end{large}}}\\
\vspace*{0.1cm} 
\hspace*{5.0cm} \textbf{- John Johnson}
\end{center}
    \newpage
    \approvalsheet
    \internapprovalsheet
    \declaration
    \newpage
    \signaturepage
    \newpage
    \internshipsignaturepage
    }

\def\prefacesection#1{%
    \chapter*{#1}
    \addcontentsline{toc}{chapter}{#1}}


\def\afterpreface{\newpage
    \tableofcontents
    \newpage
    \iftablespage
        {\addvspace{10pt}
        \let\saveaddvspace=\addvspace
        \def\addvspace##1{}

        \listoftables
        \let\addvspace=\saveaddvspace}
        \newpage
    \fi
    \iffigurespage
        {\addvspace{10pt}
        \let\saveaddvspace=\addvspace
        \def\addvspace##1{}

        \listoffigures
        \let\addvspace=\saveaddvspace}
        \newpage
    \fi
    \pagenumbering{arabic}
    \pagestyle{plain}
}

\setcounter{secnumdepth}{3}

\def\subsubsection{\@startsection{subsubsection}{3}{\z@}{-3.25ex plus  -1ex minus -.2ex}{1.5ex plus .2ex}{\large\sl}}
\def\thesubsubsection{\hbox{\vrule height 1ex width .75ex depth .3ex}}

%
%
% Some Theorem Environments
%
%


\newtheorem{condition}{Condition}
\newtheorem{proposition}{Proposition}[chapter]
\newtheorem{theorem}{Theorem}[chapter]
\newtheorem{defn}{Definition}[chapter]
\newtheorem{conjecture}{Conjecture}[chapter]
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{corollary}[theorem]{Corollary}
\newtheorem{problem}{Problem}[chapter]
\newtheorem{subproblem}{Subproblem}[chapter]


\newenvironment{definition}{\begin{defn}\em}{\end{defn}}
\newenvironment{proof}{\noindent{\bf Proof:}\hspace  {5mm}}{
\nopagebreak\nobreak\quad\nopagebreak\nobreak\proofbox\medskip}
\newenvironment{example}{\noindent{\bf Example}\quad}{
\nopagebreak\nobreak\quad\nobreak\nopagebreak\proofbox\smallskip}

\newcounter{case}
\newenvironment{case}{\begin{list}{\bf Case \arabic{case}:}%
{\usecounter{case}%
\labelwidth 5em
\leftmargin 5em
\setlength\listparindent{\parindent}
\makelabel}
\def\case{\item }}{\end{list}\nobreak\nopagebreak\quad\nopagebreak\nobreak\proofbox\bigskip}
\def\proofbox{\hbox{\vrule height1.2ex depth.3ex width0.8ex}}


% Get References instead of Bibliography
\def\thebibliography#1{\chapter*{References\@mkboth
% {BIBLIOGRAPHY}{BIBLIOGRAPHY}}
 {References}{References}}
 \addcontentsline{toc}{chapter}{References}%\bf
 \list
 {[\arabic{enumi}]}{\settowidth\labelwidth{[#1]}\leftmargin\labelwidth
 \advance\leftmargin\labelsep
 \usecounter{enumi}}
 \def\newblock{\hskip .11em plus .33em minus .07em}
 \sloppy\clubpenalty4000\widowpenalty4000
 \sfcode`\.=1000\relax}
\let\endthebibliography=\endlist


\RequirePackage{setspace}
\onehalfspacing
% \singlespacing
%\doublespacing
\setlength{\parskip}{12pt}

\renewcommand*\arraystretch{1.5}
%\RequirePackage{fancyhdr}
%\pagestyle{fancy}

\RequirePackage[hang,small]{caption}
\RequirePackage{multirow}
\RequirePackage{enumerate}

\renewcommand{\@makechapterhead}[1]{%
\vspace*{50\p@}%
{\parindent \z@ \raggedright \normalfont
\ifnum \c@secnumdepth >\m@ne
\huge \@chapapp\space \thechapter % Chapter number
\par\nobreak
\vspace{-10pt}
\fi
\interlinepenalty\@M
\Huge \bf #1\par % chapter title
\nobreak
\vskip 40\p@
}}

\renewcommand{\@makeschapterhead}[1]{%
\vspace*{50\p@}%
{\parindent \z@ \raggedright
\normalfont
\interlinepenalty\@M
\Huge \bf #1\par % chapter title
\nobreak
\vskip 40\p@
}}

\endinput



% --> Remove dots in TOC [24/10/2001] Thanks to the tocloft documentation! [10/11/2001]
% \renewcommand{\@dotsep}{10000}

