function [NC, points] = read_input_data1(filename1, filename2)
  fid = fopen(filename1, 'r');
  NC = fscanf(fid, "%d");
  fclose(fid);
  
  fid = fopen(filename2, 'r');
  format long g;
  points = dlmread(fid, ' ', 5, 0);
  fclose(fid);
endfunction