clear all;
close all;
clc

S=dlmread('select.txt');
x=S(:,1);
y1=S(:,4);
xlabel('N');
ylabel('Czas (ms)');

I=dlmread('insert.txt');
y2=I(:,4);

Q=dlmread('quick.txt');
y3=Q(:,4);

H=dlmread('heap.txt');
y4=H(:,4);

line(x,y1,'Color', 'r','LineWidth',2);

line(x,y2,'Color', 'g','LineWidth',2);

line(x,y3,'Color', 'b','LineWidth',2);

line(x,y4,'Color', 'y','LineWidth',2);

legend('Selection', 'Insert', 'Quick', 'Heap');