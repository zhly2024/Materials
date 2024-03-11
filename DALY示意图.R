library(tidyverse)

#基本DALY示意图
p <- ggplot()+
  scale_x_continuous(expand = c(0,0),name="age",breaks = c(0,0.4,0.75,1),labels = c("0","age of disease onset","age of death","expected age of death"),limits = c(0,1.15))+
  scale_y_continuous(expand = c(0,0),name="DW",breaks = c(0,1),labels = c("1","0"),limits = c(0,1.03))+
  geom_rect(aes(xmin=0,
                xmax=1,
                ymin=0,
                ymax=1),
            fill="#E0EEEE")+
  geom_rect(aes(xmin=0.75,
                xmax=1,
                ymin=0,
                ymax=1),
            fill="#FFEFDB")+
  geom_rect(aes(xmin=0.4,
                xmax=0.75,
                ymin=0.75,
                ymax=1),
            fill="#CAE1FF")+
  annotate("text",x=0.575,y=0.875,label = "YLD",color = "blue",size = 7)+
  annotate("text",x=0.875,y=0.5,label = "YLL",color = "black",size = 7)+
  annotate("text",x=0.375,y=0.5,label = "Health life years",color = "red",size = 10)+
  theme(axis.ticks.y=element_blank(),
        axis.ticks.x = element_blank())+
  theme_classic()
p

#添加箭头
#在theme()函数中的axis.line中添加箭头，arrow()函数用于定义箭头的类型、长度等属性

#添加开放式箭头
p1 <- p + theme(axis.line = element_line(arrow = arrow(length = unit(0.3, "cm")),linewidth=0.8))
p1

# 添加闭合箭头         
p2 <-p +theme(axis.line = element_line(arrow = arrow(length = unit(0.2, "cm"),type="closed"),linewidth=0.8))
p2

#添加双向箭头
p3 <- p+theme(axis.line.x = element_line(arrow = arrow(length = unit(0.2, "cm"),
                                                        type="closed",ends="both"),linewidth=0.8),
               axis.line.y = element_line(arrow = arrow(length = unit(0.2, "cm"),
                                                        type="closed"),linewidth=0.8))
p3