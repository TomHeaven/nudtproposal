%%%%% --------------------------------------------------------------------------------
%%
%%%%***************************** Version Information ********************************
%%
%% Copyright (C) Hanlin Tan <hanlin_tan@nudt.edu.cn> 
%% This is free software: you can redistribute it and/or modify it
%% under the terms of the GNU General Public License as published by
%% the Free Software Foundation, either version 3 of the License, or
%% (at your option) any later version.
%%
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{Style/msrproposal}
  [2021/08/21 v1.0 msrproposal
   document class]
%%%%% --------------------------------------------------------------------------------
%%
%%%%*************************** Declare Options **************************************
%%
%% end-user parameters, each option is declared by one declare option command
\newif\ifNUDT@versioninfo \NUDT@versioninfofalse
\DeclareOption{draftversion}{% draft information reminder
  \NUDT@versioninfotrue%
}
\newif\ifNUDT@singlesided \NUDT@singlesidedfalse
\DeclareOption{singlesided}{% enable single-sided printing
  \NUDT@singlesidedtrue%
}
\newif\ifNUDT@doublesided \NUDT@doublesidedfalse
\DeclareOption{doublesided}{% enable double-sided printing
  \NUDT@doublesidedtrue%
}
\newif\ifNUDT@printcopy \NUDT@printcopyfalse
\DeclareOption{printcopy}{% enable print copy layout
  \NUDT@doublesidedtrue% auto enable double-sided style
  \NUDT@printcopytrue%
}
\DeclareOption*{% handle non-implemented options
  \PassOptionsToClass{\CurrentOption}{ctexart}%
}
%% terminates all options processing
\ProcessOptions\relax
%%%%% --------------------------------------------------------------------------------
%%
%%%%*************************** Loadclass Infomation *********************************
%%
\ifNUDT@doublesided% if double-sided printing enabled
  \LoadClass[UTF8,a4paper,twoside,fntef,12pt]{ctexart}
\else% if double-sided printing isn't enabled
  \LoadClass[UTF8,a4paper,oneside,fntef,12pt]{ctexart}
\fi
%%%%% --------------------------------------------------------------------------------
%%
%%%%***************************** Package Infomation *********************************
%%
%% color packages
\RequirePackage[usenames,dvipsnames,table]{xcolor}%
%% math packages
\RequirePackage{amsmath,amssymb,amstext}
\RequirePackage[includeheadfoot]{geometry}
%%%%% --------------------------------------------------------------------------------
%%
%%%%************************ Load Class Configuretion ********************************
%%
\AtEndOfPackage{%class cfg loaded after package, makes commands at preamble take effect
  \makeatletter
  \InputIfFileExists{Style/msrproposal.cfg}{}{}
  \makeatother
}

%%%%% --------------------------------------------------------------------------------
%%
%%%%******************************* Page Layout **************************************%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\geometry{top=12mm,bottom=20mm,left=31.4mm,right=31.4mm}
\geometry{headheight=7.7mm,headsep=4.3mm,footskip=7.9mm}
%% specifies the amount of space between paragraphs.
\setlength{\parskip}{0.5ex plus 0.25ex minus 0.25ex}
%% line spacing
\renewcommand{\baselinestretch}{1.5} % line space setting
\raggedbottom % prevent adding vertical white space in strange places
%% default pagestyle is page number at bottom without headers and footers
%\usepackage{titlesec}   %设置页眉页脚的宏包
%\newpagestyle{front}{            
%	\sethead{}{}{}     %设置页眉
%	\setfoot{}{}{}      %设置页脚，可以在页脚添加 \thepage  显示页数
%	\headrule                                      % 添加页眉的下划线
%	\footrule                                       %添加页脚的下划线
%}
\pagestyle{plain}

%%%
\usepackage{enumitem}
\AddEnumerateCounter{\chinese}{\chinese}{}

%%%%% --------------------------------------------------------------------------------
%%
%%%%********************* Some Style Control Commands ********************************
%%
%% redefine cleardoublepage to empty pages
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
    \thispagestyle{empty}%
\hbox{}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}
%% underline
\renewcommand{\CJKunderlinecolor}{\color[rgb]{0,0,0}}
\def\NUDT@underline[#1]#2{%
    \CJKunderline{\hbox to #1{\hfill#2\hfill}}}
\def\NUDTunderline{\@ifnextchar[\NUDT@underline\CJKunderline}
%%%%% --------------------------------------------------------------------------------
%%
\defaultfontfeatures{Mapping=tex-text}
\xeCJKsetcharclass{"0}{"2E7F}{0}
\xeCJKsetcharclass{"2E80}{"FFFF}{1}

% ttf字体 (Windows)
\newcommand{\installttf}{
	%%%%   Thesis Fonts
	\setmainfont{Times New Roman}
	\setsansfont{Arial}
	\setmonofont{Courier New}
	%%%% Using Office Family Fonts
	\setCJKmainfont[BoldFont={STZhongsong}]{SimSun}
	\setCJKsansfont{SimHei} % Hei
	\setCJKmonofont{FangSong_GB2312} % Fangsong
	%%%% alias
	\setCJKfamilyfont{song}{SimSun}
	\setCJKfamilyfont{hei}{SimHei}
	\setCJKfamilyfont{fs}{FangSong_GB2312} % fang-song
	\setCJKfamilyfont{kai}{KaiTi} % Kai
	\setCJKfamilyfont{times}{Times New Roman} % times
	\setCJKfamilyfont{fzxbs}{FZXBSJW--GB1-0} % 方正小标宋体（Mac）
}
\installttf

\newcommand{\cusong}{\bfseries}
\newcommand{\song}{\CJKfamily{song}}     % 宋体
\newcommand{\fs}{\CJKfamily{fs}}         % 仿宋体
\newcommand{\kai}{\CJKfamily{kai}}       % 楷体
\newcommand{\hei}{\CJKfamily{hei}}       % 黑体
\newcommand{\timesnr}{\CJKfamily{times}}   % times new roman
\newcommand{\fzxbsong}{\CJKfamily{fzxbs}} % 方正小标宋
\def\songti{\song}
\def\fangsong{\fs}
\def\kaishu{\kai}
\def\heiti{\hei}
\newlength\thu@linespace
\newcommand{\thu@choosefont}[2]{%
	\setlength{\thu@linespace}{#2*\real{#1}}%
	\fontsize{#2}{\thu@linespace}\selectfont}
\def\thu@define@fontsize#1#2{%
	\expandafter\newcommand\csname #1\endcsname[1][\baselinestretch]{%
		\thu@choosefont{##1}{#2}}}
\thu@define@fontsize{chuhao}{42bp}
\thu@define@fontsize{xiaochu}{36bp}
\thu@define@fontsize{yihao}{26bp}
\thu@define@fontsize{xiaoyi}{24bp}
\thu@define@fontsize{erhao}{22bp}
\thu@define@fontsize{xiaoer}{18bp}
\thu@define@fontsize{sanhao}{16bp}
\thu@define@fontsize{xiaosan}{15bp}
\thu@define@fontsize{sihao}{14bp}
\thu@define@fontsize{banxiaosi}{13bp}
\thu@define@fontsize{xiaosi}{12bp}
\thu@define@fontsize{dawu}{11bp}
\thu@define@fontsize{wuhao}{10.5bp}
\thu@define@fontsize{xiaowu}{9bp}
\thu@define@fontsize{liuhao}{7.5bp}
\thu@define@fontsize{xiaoliu}{6.5bp}
\thu@define@fontsize{qihao}{5.5bp}
\thu@define@fontsize{bahao}{5bp}
%%%%********************** Chinese Titlepage Items ***********************************

\renewcommand\title[2][\NUDT@value@title]{
  \def\NUDT@value@title{#2}
  \def\NUDT@value@titlemark{#1}}
\def\@title{\NUDT@value@titlemark}
% 报告类型
\newcommand\proposaltype[1]{%	
	\def\NUDT@value@type{#1}
}
% 是否启用目录
\newcommand{\enabletableofcontents}[1]{
    \ifstrequal{#1}{yes}{	\def\NUDT@value@tableofcontents{\tableofcontents}	}{\def\NUDT@value@tableofcontents{}}
}

% 获取封面输入
\newcommand\classification[1]{\def\NUDT@value@classification{#1}}
\newcommand\msrtitle[1]{%
	\def\NUDT@value@title{#1}
}
\newcommand\type[1]{\def\NUDT@value@type{#1}}
\newcommand\researchdirection[1]{%
	\def\NUDT@value@researchdirection{#1}
}
\newcommand\field[1]{%
	\def\NUDT@value@field{#1}
}
\newcommand\institution[1]{\def\NUDT@value@institution{#1}}
\renewcommand\author[1]{\def\NUDT@value@author{#1}}
\newcommand\telephone[1]{\def\NUDT@value@telephone{#1}}
\newcommand\applicationdate[1]{\def\NUDT@value@applicationdate{#1}}
\newcommand\formdate[1]{\def\NUDT@value@formdate{#1}}

%%%%% --------------------------------------------------------------------------------
%%
%%%%**************************** Make Titlepage ******************************
%%
\renewcommand\maketitle{%
  \cleardoublepage
  \thispagestyle{empty}
  % 左上角 密级
  {
   \vspace*{-10pt}
   \hspace{-35pt}
   \zihao{4}\mdseries\heiti
   \begin{tabular}{c}
   {\mdseries\heiti \NUDT@label@classification \NUDT@value@classification}     \\          
   \end{tabular}
  }
   % 封面标题
   \vspace*{30pt}
   \begin{center}
   {
   	\zihao{1}\fzxbsong
    \NUDT@label@coverf \\ 
     \vspace*{10pt}
      \NUDT@label@covers
   }

    \vspace*{90pt}

    \def\tabcolsep{1pt}
    \def\arraystretch{1.35} % 控制table行高
    %\hskip -15pt
    {\songti \zihao{4}
    \begin{tabular}{lc}
      \makebox[6em][s]{\bfseries \NUDT@label@title} &  {\NUDTunderline[280pt]{\NUDT@value@title}}  \\
      \makebox[6em][s]{\bfseries \NUDT@label@type} &  \NUDTunderline[280pt]{\NUDT@value@type} \\
      \makebox[6em][s]{\bfseries \NUDT@label@researchdirection} &  \NUDTunderline[280pt]{\NUDT@value@researchdirection} \\
      \makebox[6em][s]{\bfseries \NUDT@label@field} & \NUDTunderline[280pt]{\NUDT@value@field} \\
      \makebox[6em][s]{\bfseries \NUDT@label@institution} &  \NUDTunderline[280pt]{\NUDT@value@institution} \\
      \makebox[6em][s]{\bfseries \NUDT@label@author} & \NUDTunderline[280pt]{\NUDT@value@author} \\
      \makebox[6em][s]{\bfseries \NUDT@label@telephone} &  \NUDTunderline[280pt]{ \NUDT@value@telephone}  \\
      \makebox[6em][s]{\bfseries \NUDT@label@applicationdate} &  \NUDTunderline[280pt]{ \NUDT@value@applicationdate} \\
    \end{tabular}
    }
  \end{center}

  \clearpage

  %%%% 说明页
  \vspace*{-15pt}
  \thispagestyle{empty}
  \begin{center}
  	{\bfseries \heiti \zihao{4} 填~~写~~说~~明}
  \end{center}
  	{\kai  \zihao{4}
  	\begin{enumerate}[label={\chinese*、},labelsep=0pt,labelindent=26pt,labelwidth=*,leftmargin=0pt,itemindent=*,align=left]
	    \addtolength{\itemsep}{-0.3\baselineskip} %缩小条目之间的间距
  		\item 本申报书由申报装备军内科研项目的单位填写。
  		\item 申报书经各级审核后报装备发展部综合计划局（将电子文档一同上报）。经批准的项目，申报书留装备发展部综合计划局；未被批准的项目，申报书不再退回。
  		\item {填报格式\par
  		\quad\quad 封面内容格式：四号宋体，单倍行距。正文中各级标题格式：标题2样式，小四号黑体，其中一级标题需加粗；正文内容格式：小四号宋体，首行缩进2字符；表格内容格式：五号宋体。
        }
        \item  填报内容
  		\begin{enumerate}[label={\arabic*.},labelsep=7pt,labelindent=26pt,labelwidth=*,leftmargin=0pt,itemindent=*,align=left]
		    \addtolength{\itemsep}{-0.3\baselineskip}%缩小条目之间的间距，下面类似
  			\item 	报单位应根据项目的保密要求，在封面上注明密级。
  			\item 	项目类别。填写下列内容之一：需求分析、发展论证、作战运用研究、实验评估、特殊装备科研、装备保障研究、基础理论方法研究、论证数据工程。
  			\item 	联系电话。需填写军线固定电话和手机。
  			\item   填报内容可附佐证材料。
  			\item   经费预算及安排。预算项目参照《军队科研经费使用管理规定（试行）》填写。设备费需列出详细配置。
  		\end{enumerate}
  		\item 申报书按规定格式打印（A4纸，用双面打印）。
	\end{enumerate}
 
    }
   \clearpage
  
  \if@twoside
    \thispagestyle{empty}
    \ifNUDT@versioninfo
      \vspace*{\stretch{1}}
      \begin{footnotesize}
        \noindent
        Draft Version (\today)
      \end{footnotesize}
    \fi
    \cleardoublepage
  \else
    \ifNUDT@versioninfo
      \thispagestyle{empty}
      \vspace*{\stretch{1}}
      \begin{footnotesize}
        \noindent
        Draft Version (\today)
      \end{footnotesize}
      \cleardoublepage
    \fi
  \fi
  
  %%
  %%% Generate Table of Contents
  %%
  \pagenumbering{roman} % restart numbering page using roman style 目录页码
 % \tableofcontents % 控制启用目录
  \NUDT@value@tableofcontents
  \clearpage
}

% 正文字体
\zihao{-4} \song 

%%%%% --------------------------------------------------------------------------------
\endinput
%% End of file
%%%%% --------------------------------------------------------------------------------
