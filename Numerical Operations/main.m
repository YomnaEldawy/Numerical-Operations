 clear;
 clc;
% % strArray = Read_File('test.txt');
% % epsilon = str2double(strArray(4));
% % maxIters = str2double(strArray(5));
% % initial = str2double(strArray(3));
% % y = abs(initial);
% % x= -(2*y)-2:0.1:(2*y)+2;
% % syms x;
% % %equation = 'x.^3-0.165*x.^2+3.993*10^(-4)';
% % equation=strArray(2);
% % fx = inline(char(equation));
% % [root, iterations, data] = newton_raphson(initial, epsilon, maxIters, fx);
% % hold on
% % grid on
% % %renge from (x0*(-2)-2) : 0.1 : (x0*2 + 2)
% % x= -(2*y)-2:0.1:(2*y)+2;
% % y=fx(x);
% % z=x*0;
% % plot(x,y,'r',x,z,'k');
% % title('Graph of Newton Raphson method')
% % xlabel('xi')
% % ylabel('F(xi)')
% % xi=data(:,1);  
% % disp(xi);
% % L= line([xi xi], get(gca,'ylim'),'color','b');
% % set(L,'LineWidth',2.0)
% % 
% % 
% % 
% % %===================test of gauss jordon============================
% % % c= 'x1+x2+2*x3 = 8, -x1-2*x2+3*x3 = 1, 3*x1+7*x2+4*x3 = 10 ';
% % % data = strsplit(c,', ');
% % % %disp(c);
% % % finalres={};
% % % eqn={};
% % % labels='x1 x2 x3';
% % % eval(['syms ' labels]);
% % % for i=1:numel(data)
% % %      %disp(data(i));
% % %     finalres=[finalres;char(data(i))];  
% % % end
% % % for  c = 1:numel(data)
% % % eqn = [eqn,eval(strrep(char(finalres(c)),'=','=='))];
% % % end
% % % [A,B] = equationsToMatrix(eqn);
% % % [result, steps] = gauss_jordon(A, B);
% % % a=char(steps(:,:,1));
% % % disp(a);
% % %=====================test resd file==================
% array = Read_File('test.txt');
% disp(array(1));
% disp(array(2));
% disp(array(3));
% data = strsplit(array(3),' ');
% disp(data(2));
% disp(array(4));
% disp(array(5));
maxErr='';
disp(isempty(maxErr));

