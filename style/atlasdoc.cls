%-------------------------------------------------------------------------------
% Template class for ATLAS notes
%
% See ChangeLog or SVN log for history of changes.
% Responsible: Ian Brock (ian.brock@cern.ch)
%-------------------------------------------------------------------------------
% $Id: atlasnote.cls 301586 2014-08-18 17:36:36Z brock $
% $HeadURL: svn+ssh://svn.cern.ch/reps/atlasgroups/pubcom/latex/atlasnote/trunk/atlasnote.cls $
%-------------------------------------------------------------------------------

% --- Class structure: identification part
\ProvidesClass{style/atlasdoc}[2014/08/20 v.00-95-00 ATLAS document]
\NeedsTeXFormat{LaTeX2e}

% --- Class structure: initial code part
% Defaults for title page
\newdimen\AN@skipbeforetitle
\AN@skipbeforetitle=60\p@
\newcommand\skipbeforetitle[1]{
  \AN@skipbeforetitle=#1
}

\def\@title{Title goes here}
\def\@atlastitle{Title goes here}
\def\@author{The ATLAS Collaboration}
\def\@date{\today}

% Author(s)
%\def\@makefnmark{\hbox{$^{\@thefnmark)}$}}
%\def\author#1{%% Treat the list of authors
%\setcounter{footnote}{0}\def\@currentlabel{}%
%\begingroup\def\thefootnote{\arabic{footnote}}
%\global\@topnum\z@ \large\begin{center}{\lineskip.5em
%\begin{tabular}[t]{c}#1\end{tabular}\par}
%\end{center}\par\vskip1.5em\@thanks\endgroup}
%\newenvironment{Authlist}{\begin{center}}{\end{center}}

% Document title
\newcommand{\atlastitle}[1]%
{
  \def\@title{#1}
  \def\@atlastitle{#1}
}

% Draft version 
\def\@draftversion{}
\newcommand{\draftversion}[1]%
{
  \def\@draftversion{#1}
}

% Draft heading code
\newcommand{\draftheading}%
{
  % 
  % compute the time in hours and minutes
  % make new variables \timehh and \timemm
  % 
  \newcount\timehh\newcount\timemm
  \timehh=\time 
  \divide\timehh by 60 \timemm=\time
  \count255=\timehh\multiply\count255 by -60 \advance\timemm by \count255
  % put in header
  \markboth%
  % --- Left mark
  {\hspace*{\fill}{\protect\small\bf \fbox{DRAFT}}
    \hspace*{\fill}
    \protect\makebox[0pt][r]{\protect\small\sl\today\ -- 
      \ifnum\timehh<10 0\fi\number\timehh\,:\,\ifnum\timemm<10 0\fi\number\timemm}
  }%--- right mark
  {\protect\makebox[0pt][l]{\protect\small\sl\today\ -- 
      \ifnum\timehh<10 0\fi\number\timehh\,:\,\ifnum\timemm<10 0\fi\number\timemm}
    \hspace*{\fill}
    {\fbox{\textbf{DRAFT}}}
    \hspace*{\fill}}
  %
  \pagestyle{myheadings}
}

% ATLAS note number
\def\@atlasnote{}
\newcommand{\atlasnote}[1]{\def\@atlasnote{#1}}

% Submission details
\def\@subprepend{To be submitted to }
\newcommand{\subprepend}[1]{\def\@subprepend{#1}}
\def\@journal{}
\newcommand{\journal}[1]{\def\@journal{#1}}

% Abstract text
\def\@abstracttext{}
\newcommand{\abstracttext}[1]{\def\@abstracttext{#1}}

% Shortcut to add submission text
\newcommand{\submitted}%
{
  \ifx\@journal\@empty\mbox{}%
  \else
  \vskip 0.8in plus 2in%
  \begin{center}%
    \@subprepend\space {\it \@journal}%
    \vskip 1.5em%
  \end{center}%
  \vskip 0.5in
  \fi
}

% --- Class structure: declaration of options part
% Cover page off by default
\let\if@CoverPage\iffalse
\DeclareOption{coverpage}{\let\if@CoverPage\iftrue}
% Title page on by default
\let\if@MakeTitle\iftrue
\DeclareOption{nomaketitle}{\let\if@MakeTitle\iffalse}
% Paper size A4 by default
\let\if@APaper\iftrue
\let\if@LPaper\iffalse
\DeclareOption{a4paper}{\let\if@APaper\iftrue \let\if@LPaper\iffalse}
\DeclareOption{letterpaper}{\let\if@APaper\iffalse \let\if@LPaper\iftrue}
% Include tikz package off by default
\let\if@usetikz\iffalse
\DeclareOption{usetikz}{\let\if@usetikz\iftrue}

% This class extends the article class
% Read all the atlasnote options, pass them to article
%\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

% --- Class structure: execution of options part
\ProcessOptions \relax

% --- Class structure: declaration of options part
\if@APaper
  \LoadClass[titlepage,a4paper,11pt]{article}
	\RequirePackage[a4paper]{geometry}
\else
  \LoadClass[titlepage,letterpaper,11pt]{article}
	\RequirePackage[letterpaper]{geometry}
\fi

% Redefine the page size - use fraction of paper, so it works for A4 and letter
\geometry{
  centering,scale=0.75,%
  marginparsep=0.2cm,% 
  marginparwidth=1.8cm%
}

% --- Class structure: main code part
% ATLAS Cover Page
\if@CoverPage \RequirePackage[atlasdoc]{style/atlascover} \fi

% Remove the numbers from all the headings (\section, \subsection, etc.)
%\setcounter{secnumdepth}{-1}

% Required packages
\RequirePackage{graphicx}
\RequirePackage{color}


% Environment for analysis contributers
\newenvironment{atlascontribute}[1][3.5cm]
  {\section*{List of contributions to analysis}
   \begin{list}{}%
    {\setlength{\leftmargin}{#1}
     \setlength{\labelwidth}{#1}
     \addtolength{\leftmargin}{0.2cm}
     \setlength{\labelsep}{0.2cm}
     \setlength{\itemsep}{0.0cm}
     \renewcommand{\makelabel}[1]{##1 \hfill}}
  }
  {\end{list}
}

% Title page design
\newcommand{\maketitlepage}{%
  \null
  \thispagestyle{empty}
  \pagestyle{plain}
  \pagenumbering{arabic}
  \ifx\@draftversion\@empty\mbox{}%
  \else \flushright Draft version \@draftversion \\ 
  \fi
  \begin{center}
    \vspace*{-6mm}
    \includegraphics[width=3cm]{AT_atlaslogo} 
    \hfill 
    \begin{minipage}[b]{7cm}
      \vfill
      \begin{center}
        {\huge \bf \textsf{ATLAS NOTE}}%
        % ATLAS note number, if any 
				% (not used anymore, automatically stamped on PDF by CDS)
        %\ifx\@atlasnote\@empty \vskip 2mm \mbox{}%
        %\else \vskip 4mm {\Large \@atlasnote} \vskip 2mm%
        %\fi
        % Date, if any
        \ifx\@date\@empty\mbox{}%	
        \else \vskip 2mm \@date%
        \fi
      \end{center}
      \vfill
    \end{minipage}
    \hfill
    \includegraphics[width=3cm]{AT_cernlogo}    
  \end{center}
  % Add line numbers to front page content 
  {%
  \ifx\@draftversion\@empty%
  \else\linenumbers
  \fi
  % Title, author(s)
  %\vskip 60\p@
  \vskip \AN@skipbeforetitle
  \begin{center}%
    {\Large\bf \@atlastitle \par}%
    \vskip 3em%
    {\large
     \lineskip .75em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
  \end{center}\par
  \vfill
  % Abstract
  \if\@abstracttext\@empty\mbox{}%
  \else%
  \begin{center}
    {\bfseries \abstractname}
    \quotation
    \@abstracttext
    \endquotation
  \end{center}
  \fi
  \vfill
  % Submission details
  \submitted
  % Thanks
  \@thanks
  }%
  %\vfil\null%
}

% This some before-and-after code that surrounds the title page. It
% shouldn't need to be modified. I've pulled out the part the actually
% typesets the title page and placed it in the \maketitlepage command
% above.
\renewcommand\maketitle{%
  \begin{titlepage}%
    \let\footnotesize\small%
    \let\footnoterule\relax%
    \let \footnote \thanks%
    \maketitlepage%
    \let\thefootnote\relax\footnotetext{\copyright\ Copyright \the\year\ CERN for the benefit of the ATLAS Collaboration. \\ \indent \indent Reproduction of this article or parts of it is allowed as specified in the CC-BY-3.0 license.}
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \setcounter{page}{1}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}


\AtBeginDocument{
  % If selected, generate ATLAS Cover Page
  \if@CoverPage 
  \AC@PrintAtlasCover%
  \AC@PrintAtlasPage%
  \fi
  % Automatically generate title page
  \if@MakeTitle
  \maketitle
  \fi
  % Add draft heading and line numbers
  \ifx\@draftversion\@empty%
  \else \linenumbers \draftheading 
  \fi
  % Hack for tikz (must be loaded here in order to avoid conflicts with graphicx user in \maketitle}
  \if@usetikz \RequirePackage{tikz} \fi
  %\pagenumbering{arabic} % reset page numbering after title page
}

% That's all, folks!
\endinput
