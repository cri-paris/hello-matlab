classdef RawMortality < Mortality

    properties
        nonstated;
        total;
    end   
    methods(Static)
        function result = load(fileName,sheet)
            if(exist('fileName','var') == 0) , fileName = 'influenza.xls'; end
            [data,header] = xlsread(fileName,sheet);
            caption = header(1);
            spans = header(2:end);
            result = RawMortality(data,spans,caption);
        end
    end

    methods
        function obj = RawMortality(data,spans,caption)
            obj@Mortality(data,spans,caption,2);
            obj.total = obj.rawData(:,end);
            obj.nonstated = obj.rawData(:,end-1);
        end
        
        
        function r = plusRawMortality(obj1,obj2)
             if(size(obj1.rawData)~=size(obj2.rawData))
                error('cannot sum up populations because sizes are different');
            end
            data2 = obj1.rawData+obj2.rawData;
            %warning spans are not checked
            r = RawMortality(data2,obj1.spans,obj1.caption);
        end
        
        function r = plus(obj1,obj2)
           if(isa(obj2,'RawMortality'))
               r = obj1.plusRawMortality(obj2);
           else
               error('adding unsupported class');
           end
        end
    end
    
end

