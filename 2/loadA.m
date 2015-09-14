function a = loadA(fileName,base)
  if(exist('fileName','var') == 0) , fileName = 'a.mat'; end
  if(exist('base','var') == 0) , base = '/home/antonkulaga/CRI/hello-matlab/2/data/'; end  
  f = strcat(base,fileName);
  s = load(f);
  a = s.A;
end