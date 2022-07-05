%% Actual running code for binary conversion  
clear all;
%clc;
tic
fileID = fopen('sdrfile_O.bin','w');            %filename
load("sdrfile.mat");
[nRows, tmp, nCols] = size(Ofiles.data);
vec_comp = zeros(nRows*nCols,1);
i = 1;

%% old version
% for c=1:nCols
%     for r=1:nRows
%         disp(i)
%         vec_comp(i) = Ofiles.data(r,tmp,c);
%         i = i+1;
%     end
% end

% % for c=1:nCols
% %     disp(c);
% %     vec_comp(i:i+nRows-1) = Ofiles.data(:,tmp,c);
% %     i = i+nRows;
% % end
% % 
% % 
% % vec = zeros(2*length(vec_comp),1);
% % vec(1:2:end) = real(vec_comp);
% % vec(2:2:end) = imag(vec_comp);
% % %a= complex(OFvar.data);
% % fwrite(fileID, vec, 'int16');
% % fclose(fileID);
%% updated version
vec = zeros(2*nRows,1);
for c=1:nCols
    %disp(c);
%     vec_comp_tmp = Ofiles.data(:,tmp,c);
%     vec(1:2:end) = real(vec_comp_tmp);
%     vec(2:2:end) = imag(vec_comp_tmp);
%     vec_comp_tmp = Ofiles.data(:,tmp,c);
    vec(1:2:end) = real(Ofiles.data(:,tmp,c));
    vec(2:2:end) = imag(Ofiles.data(:,tmp,c));
    fwrite(fileID, vec, 'int16');
end


% vec = zeros(2*length(vec_comp),1);
% vec(1:2:end) = real(vec_comp);
% vec(2:2:end) = imag(vec_comp);
%a= complex(OFvar.data);
% fwrite(fileID, vec, 'int16');
fclose(fileID);






%% testing    
% a=[1 2 3 4 5 6 7 8 9 0];
% fileID = fopen('nine.bin','w');
% fwrite(fileID,a,'short');
% fclose(fileID);
%% vector reading file 
% fileid=fopen('sdrfile_in16.bin','r');
% while ~feof(fileid)
%     
%     a=fgetl.complex(fileid);
%     disp(a);
% end

%% 
% fileID = fopen('exp.txt','w');
% fprintf(fileID,'%6s %12s\n','x','exp(x)');
% fprintf(fileID,'%6.2f %12.8f\n',A);
% fclose(fileID);

%% testing 
toc
