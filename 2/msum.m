function msum(base,from,to)
 if(exist('base','var') == 0) , base = '/home/antonkulaga/CRI/hello-matlab/2'; end
 if(exist('from','var') == 0) , base = 'load1.mat'; end  
 if(exist('to','var') == 0) , base = 'save1.mat'; end   

 input = strcat(base,'/data/',from);  
 output = strcat(base,'/output/',to); 
 s = load(input,'m');
 disp(s);
 save(output,s);  
end