function [deflectionInNm, avgGapSize, stress, electrostaticForce] = analizeData(data)
    
    %Finds the defelection in nm from the number of fringes counted
    deflectionInNm = data.* [1,(633/2),1];

    %Averages the microsccope air gap size estimations
    means = mean(data,'omitnan');
    avgGapSize = means(3);

    %Calulates the stress of the membranes
    %!!!! THIS MAY ONLY WORK FOR SMALL DEFELCTION IDK ABOUT BIGGER SHIT
    %Assumes 3mm mebrane size, 3.5um membrane thickness
    %used formula from https://ieeexplore.ieee.org/stamp/stamp.jsp?arnumber=8390905
    stress = (1.0006*9.*(data(:,1).^2))./(8*3.5.*avgGapSize.^2.*(deflectionInNm(2))*10.^-9);

    %Calculates the electrosatic force on the membrane and does shit, idk
    %what x0 is so it is set to zero in this term
    electrostaticForce = (0.5)*(1.0006.*(data(:,1).^2))./(avgGapSize-1).^2;
    

end
