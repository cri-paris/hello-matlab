classdef solution
   properties
      filename = 'timecourse.mat';
      data;
      blank;
      test;
      control;      
   end
   methods
       function obj = solution()
            data = load('timecourse.mat');
            m = data.realdata;
            obj.blank = m(1,:);
            obj.test = m(2,:) - obj.blank; %test group
            obj.control = m(3,:) - obj.blank; %negative control group      
            obj.data = data;            
       end   
       %draws the plots of data
       function obj = draw(obj)
            plot(obj.test);                    
            hold on;
            title('Luminescence experiment');    
            xlabel('time (sec * 5)') % x-axis label
            ylabel('luminescence (lm)') % y-axis label
            plot(obj.control);    
            legend('test','negative control')    
            hold off;    
       end
       %models differential equation
       function result = forecast(obj)
           [~,y]=dsolve('Dx=0.9','Dy=0.3*x^2-0.5*y','x(0)=0','y(0)=0');
           [~,s] = size(obj.control); %get number of measurements
           ezplot(y,[0 s]);
           title('GFP production prediction');    
           xlabel('time sec') % x-axis label
           ylabel('GFP production') % y-axis label                      
           result = y;
       end
       
       function [dr,dy] = der(obj,r,g)
           dr = 0.9;
           dy = 0.3*r^2-0.5*g;
       end
       
       function numericForecast(obj)           
           [~,s] = size(obj.control); %get number of measurements           
           ode45(@obj.der,[0,s],[0;0])
       end
   end
end