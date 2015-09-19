classdef Influenza
    %INFLUENZA Summary of this class goes here
    %   1. A first kind of graph we want to extract from these data would show us, for a given time point
    % (parameter), what is the mortality by influenza (y-axis) for each age category (x-axis).
    % 2. A second kind of graph we want to extract from these data would show us, for a given age category
    % (parameter), what is the mortality by influenza (y-axis) at each time point (x-axis).
    % 3. A third kind of graph we want to extract from these data would show us, for people born in a given
    % year (parameter), what is the mortality by influenza (y-axis) at each age (x-axis).
    % Plot one graph of each category. Do not forget to label the axes of your plot, add a legend, ...
    
    properties
        rawMales;
        rawFemales;
        rawTotal;
        populationMales;
        populationFemales;
        populationTotal;
        oneMinusTotMales;
        oneMinusTotFemales;
    end
    
    methods
        function obj = Influenza(fileName)
            if(exist('fileName','var') == 0) , fileName = 'influenza.xls'; end
            obj.rawMales = RawMortality.load(fileName,'Raw Data (EAM)');
            obj.rawFemales = RawMortality.load(fileName,'Raw Data (EAF)');
            obj.rawTotal = obj.rawMales+obj.rawFemales;
            obj.rawTotal.caption = 'Total people';
            obj.populationMales = Population.load(fileName,'Population (EAM)');
            obj.populationFemales = Population.load(fileName,'Population (EAF)');
            obj.populationTotal = obj.populationFemales+obj.populationMales;
            obj.populationTotal.caption = 'Total population';
            obj.oneMinusTotMales = Mortality.load(fileName,'1 minus TOT (EAM)');            
            obj.oneMinusTotFemales = Mortality.load(fileName,'1 minus TOT (EAF)');                        
        end                
        
    end
    
end

