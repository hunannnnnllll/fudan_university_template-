% 定义文档类
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mystyle}[2024/12/20 Custom Document Class]
% 基于 article 类
\LoadClass[a4paper,12pt]{article}
% 页面布局
\RequirePackage[top=2.54cm, bottom=2.54cm, left=3.18cm, right=3.18cm]{geometry}
% 中文支持
\RequirePackage{ctex}
\RequirePackage{fontspec}
\RequirePackage[AutoFakeBold,AutoFakeSlant]{xeCJK}
% 图像支持
\RequirePackage{graphicx}
% 行距与段落设置
\RequirePackage{setspace}
\setlength{\parskip}{0pt} % 段落间距
\setlength{\baselineskip}{20pt} % 固定行高20pt
% 字体设置
\renewcommand{\rmdefault}{ptm} % Times New Roman 英文字体

% 设置英文字体为 Times New Roman
\setmainfont{Times New Roman}
% 设置中文字体为宋体
\setCJKmainfont{Noto Serif CJK SC} % 替代宋体的开源字体

% 超链接设置
\RequirePackage[colorlinks=true, linkcolor=blue, urlcolor=blue, citecolor=blue]{hyperref}

% TikZ 绘图设置
\RequirePackage{tikz}
\RequirePackage{everypage}
\AddEverypageHook{%
    \begin{tikzpicture}[remember picture, overlay]
        % 绘制灰色虚线
        \draw[gray, dashed, line width=0.4pt] 
            ([xshift=1.5cm]current page.west|-current page.north) -- 
            ([xshift=1.5cm]current page.west|-current page.south);
         % 添加竖排文字
        \node[gray, anchor=center] at ([xshift=0.75cm]current page.west|-current page.center) {%
            \begin{tabular}{c} % 使用 tabular 环境分行显示文字
            装\\
            订\\
            线\\
            内\\
            不\\
            要\\
            答\\
            题\\
            \end{tabular}
        };
    \end{tikzpicture}%
}

% 字体与表格
\RequirePackage{graphicx}
\RequirePackage{array}
\RequirePackage{longtable}
\RequirePackage{tabularx}

% 定义可设置的封面变量
\newcommand{\papertitle}{未指定}      % 论文题目
\newcommand{\courseinfo}{未指定}      % 修读课程
\newcommand{\semester}{未指定}        % 选课学期
\newcommand{\studentname}{未指定}     % 学生姓名
\newcommand{\studentid}{未指定}       % 学号
\newcommand{\completiondate}{未指定}  % 完成日期


% 定义封面页命令
\newcommand{\maketitlepage}{
    \begin{titlepage}
        % 使用 TikZ 放置表格到右上角
        \begin{tikzpicture}[remember picture, overlay]
           \node[anchor=north east] at ($(current page.south east)+(-3.18cm,26.5cm)$) {
                \renewcommand{\arraystretch}{1.5} % 调整表格行高
                \begin{tabular}{|p{1.5cm}|p{2cm}|}
    \hline
    \fontsize{14}{16}\selectfont 成 \hspace{0.5em} 绩 & \\ \hline
    \fontsize{14}{16}\selectfont 评阅人 & \\ \hline
\end{tabular}

            };
        \end{tikzpicture}


        \vspace{120pt}
        % 标题部分
        \begin{center}
            {\CJKfontspec{Noto Sans CJK SC}\fontsize{26}{26}\selectfont \textbf{复\hspace{0.5em} 旦\hspace{0.5em}大\hspace{0.5em} 学}}\\[1cm]
            {\CJKfontspec{Noto Sans CJK SC}\fontsize{26}{26}\selectfont \textbf{研\hspace{0.5em} 究 \hspace{0.5em}生 \hspace{0.5em}课 \hspace{0.5em}程\hspace{0.5em} 论 \hspace{0.5em}文}}\\[3.5cm]

            % 论文详细信息部分
    % 使用 longtable
\begin{longtable}{@{}p{3cm}p{12cm}@{}}
    {\fontsize{14}{16}\selectfont \textbf{论文题目：}} & {\Fangsong\fontsize{14}{16}\selectfont \papertitle} \\[0.5cm]
    {\fontsize{14}{16}\selectfont \textbf{修读课程：}} & {\Fangsong\fontsize{14}{16}\selectfont \courseinfo} \\[0.5cm]
    {\fontsize{14}{16}\selectfont \textbf{选课学期：}} & {\Fangsong\fontsize{14}{16}\selectfont \semester} \\[0.5cm]
    {\fontsize{14}{16}\selectfont \textbf{选课学生：}} & {\Fangsong\fontsize{14}{16}\selectfont \studentname（\studentid）} \\[0.5cm]
    {\fontsize{14}{16}\selectfont \textbf{完成日期：}} & {\Fangsong\fontsize{14}{16}\selectfont \completiondate} \\
\end{longtable}

        \end{center}
    \end{titlepage}
}



\setcounter{table}{0}

% 标题格式设置
\RequirePackage{titlesec}
% 替换章节编号为中文大写数字
\newcommand{\chineseSectionNumber}[1]{%
  \ifcase#1\relax
  \or 一\relax
  \or 二\relax
  \or 三\relax
  \or 四\relax
  \or 五\relax
  \or 六\relax
  \or 七\relax
  \or 八\relax
  \or 九\relax
  \else #1\fi
}
\renewcommand{\thesection}{\chineseSectionNumber{\value{section}}}
\titleformat{\section}[block]{\bfseries\fontsize{12}{14}\selectfont}{\thesection、}{0.5em}{}

% 替换小节编号为中文括号数字
\newcommand{\chineseSubsectionNumber}[1]{%
  \ifcase#1\relax
  \or 一\relax
  \or 二\relax
  \or 三\relax
  \or 四\relax
  \or 五\relax
  \or 六\relax
  \or 七\relax
  \or 八\relax
  \or 九\relax
  \else #1\fi
}
\renewcommand{\thesubsection}{（\chineseSubsectionNumber{\value{subsection}}）}
\titleformat{\subsection}[block]{\bfseries\fontsize{12}{14}\selectfont}{\thesubsection}{0.5em}{}


\setcounter{secnumdepth}{3}  % 允许显示 subsubsection 编号

% 将 subsubsection 编号设置为普通数字
\renewcommand{\thesubsubsection}{\arabic{subsubsection}}



% 参考文献设置
\RequirePackage[backend=biber,style=gb7714-2015,sorting=none]{biblatex}
\addbibresource{references.bib} % 默认引用 references.bib 文件
\defbibheading{bibliography}[参考文献]{%
  \section*{\fontsize{10.5}{12}\selectfont \textbf{#1}}}
