classdef Mortality
    %MORTALITY easy way of handling the data
    % separates axes from data
    
    properties
        rawData;
        caption;
        years;
        spans;
        data;
    end
    
    methods(Static)
        function result = load(fileName,sheet,skipCols)
            if(exist('skipCols','var') == 0) , skipCols = 0; end   
            if(exist('fileName','var') == 0) , fileName = 'influenza.xls'; end
            [data,header] = xlsread(fileName,sheet);
            caption = header(1);
            spans = header(2:end);
            result = Mortality(data,spans,caption,skipCols);
        end
    end
    
    methods
        function obj = Mortality(data,spans,caption,skipCols)
            obj.rawData = data;         
            obj.caption = caption;
            obj.years = data(:,1);
            obj.spans = spans;
            obj.data = obj.rawData(:,2:end-skipCols);            
        end   
        
        function drawYear(obj,year)
            y = find(obj.years==year);
            if(isempty(y)) 
                disp(strcat('we do not have data on ', year));
                return; 
            end;
            row = obj.data(y,:); 
            bar(row);
            set(gca,'XTickLabel',obj.spans);
            %title(strcat(obj.caption,'for '));
            %xlabel(obj.spans);
        end                     
    end
    
end

