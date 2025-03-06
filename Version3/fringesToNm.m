function [deflectionInNm] = fringesToNm(data)
%this function takes in the interferometer data and putputs the deflection
%in nm
    deflectionInNm = data.* [1,(633/2)];
end
