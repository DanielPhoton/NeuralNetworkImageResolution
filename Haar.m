function H = Haar(h)
%%h is a MxN matrix
HN = zeros(length(h(1,:,1)));
HM = zeros(length(h(:,1,1)));
%%Haar MxM matrix
for m = 1:2:length(h(:,1,1))-1
    HM(floor(m/2)+1,m) = sqrt(2)/2;
    HM(floor(m/2)+1,m+1) = sqrt(2)/2;
    HM(floor(m/2)+1+floor(length(h(:,1,1))/2), m) = -sqrt(2)/2;
    HM(floor(m/2)+1+floor(length(h(:,1,1))/2), m+1) = sqrt(2)/2;
end
HM
%%Haar NxN matrix
for n = 1:2:length(h(1,:,1))-1
    HN(floor(n/2)+1,n) = sqrt(2)/2;
    HN(floor(n/2)+1,n+1) = sqrt(2)/2;
    HN(floor(n/2)+1+floor(length(h(1,:,1))/2), n) = sqrt(2)/2;
    HN(floor(n/2)+1+floor(length(h(1,:,1))/2), n+1) = -sqrt(2)/2;
end
HR = h(:,:,1); %Deconstructing the image into its Color Channels
HG = h(:,:,2);
HB = h(:,:,3);
HR = HM*HR*HN'; %Performing the Haar Transform on each Channel
HB = HM*HB*HN';
HG = HM*HG*HN';
H(:,:,1) = HR; %Reconstructing the transformed matrix
H(:,:,2) = HG;
H(:,:,3) = HB;
end


    
    

