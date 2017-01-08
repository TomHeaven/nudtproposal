# NUDT硕士博士研究生开题报告latex模板说明

# 前言
用过latex就会知道它的好，但是没有模板的时候真的很痛。所以"NUDT硕士博士研究生开题报告latex模板"应运而生了。

这里必须吐槽：
+ 我校的开题报告竟然放在一个表里！！！这在全国高校里不多见。
+ 开题报告的文献竟然也是放在表格里，这个罕见的设定让作者足足抓狂了三天。并且还留下了一个会带来一点点不方便的BUG。

# 用法

## 首页设定

nudtProposal.tex 中的注释已有详细说明：
```
%%%%% --------------提示：修改本节内容用于设置文档，请仔细阅读---------------------
%% 
%% 编译环境：texlive-2015。
%% 推荐IDE：texstudio（WinXXX 太挫了）。
%% 编译选项：tex编译器选择xelatex， 参考文献编译器选择biber（不能用bibtex）！
%% 以上环境配置经过作者测试，确定可以正常使用。

%%%%% ---------------提示：本参数提供一个参考文献格式BUG的临时解决方案------------
% 是否将参考文献放入表格。这个选项的设置因为参考文献格式有一个暂时无解的BUG。设置为yes之前之前，必须先
% 设置为no编译一次。否则正文中引用数字都是0。
% 最终提交前将此参数改为yes编译一次。注意：设置为yes后编译第二次就会出现正文中引用数字都是0的BUG!
% 如果设置为yes后，还需要修改正文，那么改为no，编译  两次 参考文献才会正常!
\enabletablebib{no}   % 最终提交前将此参数改为yes编译一次! 如需修改正文，改为no后编译两次参考文献才会正常!   

%% 以下参数用于设置文档首页和页眉信息
\proposaltype{doctor}          % 研究生类别：硕士设置为master，博士设置为doctor 
\enabletableofcontents{no}   % 是否生成目录：如果需要目录设置为yes，否则设置为no。我校开题报告默认没有目录
\proposalnumber{\underline{\hbox to 10mm{}}}          % 编号：默认是下划线，如果你知道编号，设为真实编号
\classification{公开}              % 密级：公开，秘密，机密或者绝密
\nudttitle{国防科学技术大学开题报告}{\LaTeX{} 模板} % 因title一般都很长需要两行，第一参数为第一行内容，第二个参数为第二行内容
\author{谭同学}                    % 作者
\authorid{160590xx}            % 学号
\advisor{张老师}                   % 导师
\advisortitle{教~~~~授}         % 职称
\degreetype{工学}                 % 学位类别
\major{控制科学与工程}          % 一级学科
\field{图像处理}                      % 研究方向
\institute{信息系统与管理学院}% 学院
\chinesedate{2017~年~03~月~01日} % 开题日期
\formdate{二零一七年三月}     % 制表月份 注意：用“〇”可能会出现字体不显示的问题，所以这里改为了“零”

%% 在设置完以上参数后，修改Tex文件下对应文件以完成开题报告。
```
请注意参考文献放在表里还是一个有BUG的功能，因此撰写开题报告时设置
```
\enabletablebib{no}  
```
提交前修改为
```
\enabletablebib{yes}  
```
再编译一次，参考文献就会放在表里了。如果你遇到了参考文献不正常的情况，不要着急，改为no之后，编译几次就会正常。

## 图表插入

由于开题报告放在表里（mdframed），浮动格式figure和table都不能用了。作者提供了替代方案：
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
以上方案可以产生与figure和table同样的效果，只是不能浮动。

# 免责声明
本模板免费提供于同学们使用或修改，但is provided "As IS"。使用本模板产生的任何问题作者不承担任何直接或者间接责任。但作者会尽力帮助有需要的同学解决问题。

作者也会尽力维护模板，但是毕竟能力时间有限，盼望同学们一起来完善模板。

Contact: hanlin_tan@nudt.edu.cn