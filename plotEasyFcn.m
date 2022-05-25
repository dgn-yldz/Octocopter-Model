function [h] = plotEasyFcn(t,data,refData,titleStr,ylabelStr,LegendStr)
% Copyright (C) 2022 Dogan Yildiz <doganyildiz1990@gmail.com>
%     This program is free software: you can redistribute it and/or modify
%     it under the terms of the GNU General Public License as published by
%     the Free Software Foundation, either version 3 of the License, or
%     (at your option) any later version.
% 
%     This program is distributed in the hope that it will be useful,
%     but WITHOUT ANY WARRANTY; without even the implied warranty of
%     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%     GNU General Public License for more details.
%
% Dogan Yildiz <doganyildiz1990@gmail.com> Department of Electrical - Electronics Engineering
% Middle East Technical University, METU Teknokent
% Copyright 2019 The MathWorks, Inc
h = figure;
if(~isempty(refData))
    figure(h)
    plot(t,data,'b','Linewidth',2)
    hold on
    plot(t,refData,'r--','Linewidth',2)
    grid on
    axis tight
    title(titleStr,'Interpreter','latex')
    xlabel('time [sec]')
    ylabel(ylabelStr,'Interpreter','latex')
    legend(LegendStr{1},LegendStr{2},'Interpreter','latex');
else
    figure(h)
    plot(t,data,'b','Linewidth',2)
    grid on
    axis tight
    title(titleStr,'Interpreter','latex')
    xlabel('time [sec]')
    ylabel(ylabelStr,'Interpreter','latex')
    legend(LegendStr{1},'Interpreter','latex')
end


end

