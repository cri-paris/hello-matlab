classdef Population < Mortality
    properties
        total;
    end
    
    methods(Static)
        function result = load(fileName,sheet)
            if(exist('fileName','var') == 0) , fileName = 'influenza.xls'; end
            [data,header] = xlsread(fileName,sheet);
            caption = header(1);
            spans = header(2:end);
            result = Population(data,spans,caption);
        end
    end
    
    methods
        function obj = Population(data,spans,caption)
            obj@Mortality(data,spans,caption,1);
            obj.total = obj.rawData(:,end);
        end
        
        function r = plusPopulation(obj1,obj2)
             if(size(obj1.rawData)~=size(obj2.rawData))
                error('cannot sum up populations because sizes are different');
            end
            data2 = obj1.rawData+obj2.rawData;
            %warning spans are not checked
            p =  Population(data2,obj1.spans,obj1.caption);
            p.years = obj2.years; %ugly bugfix
            r = p;
        end
        
        function r = plus(obj1,obj2)
           if(isa(obj2,'Population'))
               r = obj1.plusPopulation(obj2);
           else
               error('adding unsupported class');
           end
        end
    end
end

