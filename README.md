# NUDT硕士博士研究生开题报告latex模板说明

# 前言

用过 latex 就会知道它的好，但是没有模板的时候真的很痛。所以“NUDT 硕士博士研究生开题报告 latex 模板”应运而生了。

# 更新日志
- 2023.04.06 修正默认正文字体为楷体5号（之前为宋体小四；感谢应同学的反馈）。
- 2023.03.08 修复中文参考文献多作者时显示异常的BUG；修复参考文献放入表格需要需要繁琐操作的问题，现在你无需再关注\enabletablebib选项了。
- 2018.08.21 修正部分错误，更新 readme 文件
- 2018.03.24 更新为二〇一八年一月版本格式
- 2017.03.09 修正了参考文献文件不能被 texstudio 自动检测到的问题。

# 用法

## 首页设定

nudtProposal.tex 中的注释已有详细说明：
```
%%%%% --------------提示：修改本节内容用于设置文档，请仔细阅读---------------------
%% 
%% 编译环境：texlive-2015或者texlive-2019。
%% 推荐IDE：texstudio。
%% 编译选项：tex 编译器选择 xelatex，参考文献编译器选择 biber（不能用bibtex）！
%% 以上环境配置经过作者测试，确定可以正常使用。

%% 以下参数用于设置文档首页和页眉信息
\proposaltype{doctor}          % 研究生类别：硕士设置为 master，博士设置为 doctor
\enabletableofcontents{no}   % 是否生成目录：如果需要目录设置为 yes，否则设置为 no。我校开题报告默认没有目录
\proposalnumber{\underline{\hbox to 10mm{}}}          % 编号：默认是下划线，评议版请设为评议版，修订版设为真实编号
\classification{公开}              % 密级：公开，秘密，机密或者绝密
\nudttitle{国防科技大学开题报告}{\LaTeX{} 模板} % 因 title 一般都很长需要两行，第一参数为第一行内容，第二个参数为第二行内容
\author{谭同学}                    % 作者
\authorid{160590xx}            % 学号
\advisor{张老师}                   % 导师
\advisortitle{教~~~~授}         % 职称
\degreetype{工学}                 % 学位类别
\major{控制科学与工程}          % 一级学科
\field{图像处理}                      % 研究方向
\institute{信息系统与管理学院}% 学院
\chinesedate{2018~年~03~月~23日} % 开题日期
\formdate{二零一八年一月}     % 制表月份 注意：用“〇”可能会出现字体不显示的问题，所以这里改为了“零”
```

## 图表插入

由于开题报告放在表里（mdframed），浮动格式 figure 和 table 都不能用了。作者提供了替代方案：
```
%% ----------------注意： mdframed 中不能使用 figure 和 table。用以下示例方法替代。----------------
\begin{center}
	\includegraphics[width=0.7\linewidth]{Img/fig1}
	\captionof{figure}{人群四散逃离的异常事件（全局异常事件）} % \caption{} 改为 \captionof{figure}{}
	\label{fig:fig1}
\end{center}

\begin{center}
	\includegraphics[width=0.7\linewidth]{Img/fig2}
	\captionof{figure}{摩托车违章逆行的异常事件（局部异常事件）} % \caption{} 改为 \captionof{figure}{}
	\label{fig:fig2}
\end{center}


\begin{center}
	\captionof{table}{一张表}   % \caption{} 改为 \captionof{table}{}
	\begin{tabular}{lrrr} \hline
		年份        & 乡村 & 城市 & 所有   \\ \hline
		1983        & 38.7  & 55.6  & 44.7  \\
		1993–1994   & 50.3  & 66.4  & 54.3  \\
		2004–2005   & 50.2  & 69.3  & 55    \\
		2009–2010   & 51.7  & 71.6  & 57.1  \\ \hline
		\multicolumn{4}{@{}l@{}}{\footnotesize 来源: http://tomheaven.cn} 
	\end{tabular}
    \label{tab:tab1}
\end{center}
```
以上方案可以产生与 figure 和 table 同样的效果，只是不能浮动。

# Texlive 的安装方法

- Texlive 官网：<https://www.tug.org/texlive/acquire-netinstall.html>
- Windows 安装程序（在线）：<http://mirror.ctan.org/systems/texlive/tlnet/install-tl-windows.exe>
- Ubuntu 可以直接安装：`sudo apt-get install texlive-full`
- macOS 安装方法：<http://www.tug.org/mactex/>

注意，一些 Windows 旧版本的 MiKTex 不带 biber，无法编译参考文献，请更新为最新版本的 texlive。

# FAQ

## 1. 有时候参考文献不能及时更新的解决方案

作者在使用中发现个别时候 texstudio 并不能自动检测到参考文献更新了，故而提供一种手动更新参考文献的方法：执行“工具”->“编译”（快捷键F6）；执行“工具”->“命令”->“biber”（可以在选项中设置这个命令的快捷键为 F4）；再次执行编译。这样参考文献就手动更新了。


## 2. 编译报错："misplaced alignment tab character &"

这是因为在参考文献.bib文件中有条目包含了"&"字符，解决方案是将 "&" 替换为 "\\&"，或者直接删除。


# 免责声明

本模板免费提供于同学们使用或修改，但 is provided "As IS"。使用本模板产生的任何问题作者不承担任何直接或者间接责任。但作者会尽力帮助有需要的同学解决问题。

作者也会尽力维护模板，但是毕竟能力时间有限，盼望同学们一起来完善模板。

Contact: hanlin_tan@nudt.edu.cn
