function c = sumA()
  m = loadA();
  [~,cl] = size(m);
  loop = 2:2:cl;
  even = m(:,loop);
  c = sum(even);
end