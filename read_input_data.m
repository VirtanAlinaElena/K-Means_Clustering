[[function [NC, points] = read_input_data(filenames)
  fid = fopen('date.param', 'r');
  NC = fscanf(fid, "%d");
  fclose(fid);
  
  fid = fopen('date.points', 'r');
  formatSpec = '%f';
  sizepoints = [inf 3];
  points = fscanf(fid, formatSpec, sizepoints);
  fclose(fid);
endfunction